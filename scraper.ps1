# ============================================================
# Scraper - Chateau Jardin (Exto)
# Baixa HTML, imagens e extrai textos do site de referencia
# ============================================================

$PageUrl   = "https://www.exto.com.br/empreendimentos/chateau-jardin"
$OutputDir = Join-Path $PSScriptRoot "assets"
$ImagesDir = Join-Path $OutputDir "images"
$DataFile  = Join-Path $OutputDir "site_data.json"
$LogFile   = Join-Path $OutputDir "scraper.log"

New-Item -ItemType Directory -Force -Path $OutputDir | Out-Null
New-Item -ItemType Directory -Force -Path $ImagesDir | Out-Null

function Write-Log($msg) {
    $ts = Get-Date -Format "HH:mm:ss"
    $line = "[$ts] $msg"
    Write-Host $line
    Add-Content -Path $LogFile -Value $line -Encoding UTF8
}

$UA = "Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 Chrome/120 Safari/537.36"

Write-Log "=== Iniciando scraping: $PageUrl ==="

# ── 1. Baixar HTML ──────────────────────────────────────────
Write-Log "Baixando HTML..."
try {
    $req = [System.Net.HttpWebRequest]::Create($PageUrl)
    $req.UserAgent = $UA
    $req.Accept = "text/html,application/xhtml+xml,*/*;q=0.8"
    $req.Headers.Add("Accept-Language", "pt-BR,pt;q=0.9")
    $req.Timeout = 60000
    $res  = $req.GetResponse()
    $sr   = New-Object System.IO.StreamReader($res.GetResponseStream(), [System.Text.Encoding]::UTF8)
    $Html = $sr.ReadToEnd()
    $sr.Close(); $res.Close()
    $HtmlFile = Join-Path $OutputDir "page.html"
    [System.IO.File]::WriteAllText($HtmlFile, $Html, [System.Text.Encoding]::UTF8)
    Write-Log "HTML salvo ($([Math]::Round($Html.Length/1024))KB)"
} catch {
    Write-Log "ERRO ao baixar HTML: $_"
    exit 1
}

# ── 2. Extrair URLs de imagens ──────────────────────────────
Write-Log "Extraindo URLs de imagens..."
Add-Type -AssemblyName System.Web

$ImageUrls = New-Object System.Collections.Generic.HashSet[string]

# Padrao 1: src="http...jpg/jpeg/png/webp/gif"
$rx1 = New-Object System.Text.RegularExpressions.Regex('src="(https?://[^"]+\.(?:jpg|jpeg|png|webp|gif))"', [System.Text.RegularExpressions.RegexOptions]::IgnoreCase)
foreach ($m in $rx1.Matches($Html)) { [void]$ImageUrls.Add($m.Groups[1].Value) }

# Padrao 2: href="http...jpg/jpeg/png/webp"
$rx2 = New-Object System.Text.RegularExpressions.Regex('href="(https?://[^"]+\.(?:jpg|jpeg|png|webp))"', [System.Text.RegularExpressions.RegexOptions]::IgnoreCase)
foreach ($m in $rx2.Matches($Html)) { [void]$ImageUrls.Add($m.Groups[1].Value) }

# Padrao 3: url("http...jpg") dentro de CSS inline
$rx3 = New-Object System.Text.RegularExpressions.Regex('url\("(https?://[^"]+\.(?:jpg|jpeg|png|webp))"\)', [System.Text.RegularExpressions.RegexOptions]::IgnoreCase)
foreach ($m in $rx3.Matches($Html)) { [void]$ImageUrls.Add($m.Groups[1].Value) }

# Padrao 4: content="http...jpg" (og:image etc)
$rx4 = New-Object System.Text.RegularExpressions.Regex('content="(https?://[^"]+\.(?:jpg|jpeg|png|webp))"', [System.Text.RegularExpressions.RegexOptions]::IgnoreCase)
foreach ($m in $rx4.Matches($Html)) { [void]$ImageUrls.Add($m.Groups[1].Value) }

# Padrao 5: data-src="http...jpg"
$rx5 = New-Object System.Text.RegularExpressions.Regex('data-src="(https?://[^"]+\.(?:jpg|jpeg|png|webp))"', [System.Text.RegularExpressions.RegexOptions]::IgnoreCase)
foreach ($m in $rx5.Matches($Html)) { [void]$ImageUrls.Add($m.Groups[1].Value) }

# Padrao 6: JSON "url":"http...jpg"
$rx6 = New-Object System.Text.RegularExpressions.Regex('"url":"(https?://[^"]+\.(?:jpg|jpeg|png|webp))"', [System.Text.RegularExpressions.RegexOptions]::IgnoreCase)
foreach ($m in $rx6.Matches($Html)) { [void]$ImageUrls.Add($m.Groups[1].Value) }

# Filtrar icones/logos minusculos e thumbnails
$Filtered = $ImageUrls | Where-Object {
    $_ -notmatch "favicon" -and
    $_ -notmatch "150x150" -and
    $_ -notmatch "300x300" -and
    $_ -notmatch "/icon" -and
    $_ -notmatch "logo-small"
}

Write-Log "Imagens encontradas: $($Filtered.Count)"

# ── 3. Baixar imagens ───────────────────────────────────────
Write-Log "Baixando imagens..."
$Downloaded = New-Object System.Collections.Generic.List[hashtable]
$i = 0
$FailCount = 0

foreach ($imgUrl in $Filtered) {
    $i++
    try {
        $uri      = New-Object System.Uri($imgUrl)
        $fileName = [System.IO.Path]::GetFileName($uri.AbsolutePath)
        $fileName = ($fileName -split "\?")[0]   # remove query string
        if ($fileName.Length -lt 5) { $fileName = "img_$i.jpg" }

        # Sanitizar nome
        $fileName = $fileName -replace '[<>:"/\\|?*]', '_'
        $localPath = Join-Path $ImagesDir $fileName

        if (Test-Path $localPath) {
            $sz = [Math]::Round((Get-Item $localPath).Length / 1024)
            if ($sz -gt 5) {
                Write-Log "  [$i] Ja existe: $fileName ($($sz)KB)"
                $Downloaded.Add(@{ url = $imgUrl; local = "assets/images/$fileName"; name = $fileName; size_kb = $sz })
                continue
            }
        }

        Write-Log "  [$i] Baixando: $fileName"
        $wc = New-Object System.Net.WebClient
        $wc.Headers.Add("User-Agent", $UA)
        $wc.DownloadFile($imgUrl, $localPath)
        $wc.Dispose()

        if (Test-Path $localPath) {
            $sz = [Math]::Round((Get-Item $localPath).Length / 1024)
            Write-Log "    -> $sz KB"
            if ($sz -gt 5) {
                $Downloaded.Add(@{ url = $imgUrl; local = "assets/images/$fileName"; name = $fileName; size_kb = $sz })
            } else {
                Remove-Item $localPath -Force
                Write-Log "    DESCARTADA (< 5KB)"
            }
        }
    } catch {
        $FailCount++
        Write-Log "  ERRO [$i]: $_"
    }
    Start-Sleep -Milliseconds 150
}

Write-Log "Download concluido: $($Downloaded.Count) imagens | $FailCount falhas"

# ── 4. Extrair textos ───────────────────────────────────────
Write-Log "Extraindo textos..."

function Strip-Html($s) {
    $s = [System.Text.RegularExpressions.Regex]::Replace($s, '<[^>]+>', ' ')
    $s = [System.Web.HttpUtility]::HtmlDecode($s)
    $s = [System.Text.RegularExpressions.Regex]::Replace($s, '\s+', ' ')
    return $s.Trim()
}

$rxH    = New-Object System.Text.RegularExpressions.Regex('<h[1-4][^>]*>(.*?)</h[1-4]>', ([System.Text.RegularExpressions.RegexOptions]::Singleline -bor [System.Text.RegularExpressions.RegexOptions]::IgnoreCase))
$rxP    = New-Object System.Text.RegularExpressions.Regex('<p[^>]*>(.*?)</p>', ([System.Text.RegularExpressions.RegexOptions]::Singleline -bor [System.Text.RegularExpressions.RegexOptions]::IgnoreCase))
$rxLi   = New-Object System.Text.RegularExpressions.Regex('<li[^>]*>(.*?)</li>', ([System.Text.RegularExpressions.RegexOptions]::Singleline -bor [System.Text.RegularExpressions.RegexOptions]::IgnoreCase))
$rxSpan = New-Object System.Text.RegularExpressions.Regex('<span[^>]*>(.*?)</span>', ([System.Text.RegularExpressions.RegexOptions]::Singleline -bor [System.Text.RegularExpressions.RegexOptions]::IgnoreCase))

$Headings = @()
foreach ($m in $rxH.Matches($Html)) {
    $t = Strip-Html $m.Groups[1].Value
    if ($t.Length -gt 3 -and $t.Length -lt 300) { $Headings += $t }
}

$Paragraphs = @()
foreach ($m in $rxP.Matches($Html)) {
    $t = Strip-Html $m.Groups[1].Value
    if ($t.Length -gt 20 -and $t.Length -lt 2000) { $Paragraphs += $t }
}

$ListItems = @()
foreach ($m in $rxLi.Matches($Html)) {
    $t = Strip-Html $m.Groups[1].Value
    if ($t.Length -gt 3 -and $t.Length -lt 300) { $ListItems += $t }
}

$Spans = @()
foreach ($m in $rxSpan.Matches($Html)) {
    $t = Strip-Html $m.Groups[1].Value
    if ($t.Length -gt 3 -and $t.Length -lt 200) { $Spans += $t }
}

# Meta / OG tags
$rxOgT  = New-Object System.Text.RegularExpressions.Regex('property="og:title" content="([^"]+)"')
$rxOgD  = New-Object System.Text.RegularExpressions.Regex('property="og:description" content="([^"]+)"')
$rxOgI  = New-Object System.Text.RegularExpressions.Regex('property="og:image" content="([^"]+)"')
$rxMD   = New-Object System.Text.RegularExpressions.Regex('name="description" content="([^"]+)"')

$OgTitle = if ($rxOgT.IsMatch($Html)) { $rxOgT.Match($Html).Groups[1].Value } else { "" }
$OgDesc  = if ($rxOgD.IsMatch($Html)) { $rxOgD.Match($Html).Groups[1].Value } else { "" }
$OgImage = if ($rxOgI.IsMatch($Html)) { $rxOgI.Match($Html).Groups[1].Value } else { "" }
$MetaD   = if ($rxMD.IsMatch($Html))  { $rxMD.Match($Html).Groups[1].Value  } else { "" }

# Iframes (tour virtual, mapa, video)
$rxIf = New-Object System.Text.RegularExpressions.Regex('<iframe[^>]+src="(https?://[^"]+)"', [System.Text.RegularExpressions.RegexOptions]::IgnoreCase)
$Iframes = @()
foreach ($m in $rxIf.Matches($Html)) { $Iframes += $m.Groups[1].Value }

# Videos YouTube/Vimeo
$rxVid = New-Object System.Text.RegularExpressions.Regex('"(https?://(?:www\.youtube\.com|youtu\.be|player\.vimeo\.com)/[^"]+)"')
$Videos = @()
foreach ($m in $rxVid.Matches($Html)) {
    if (-not $Videos.Contains($m.Groups[1].Value)) { $Videos += $m.Groups[1].Value }
}

# WhatsApp links
$rxWa = New-Object System.Text.RegularExpressions.Regex('href="(https?://(?:wa\.me|api\.whatsapp\.com)[^"]+)"', [System.Text.RegularExpressions.RegexOptions]::IgnoreCase)
$WaLinks = @()
foreach ($m in $rxWa.Matches($Html)) { $WaLinks += $m.Groups[1].Value }

# Telefones
$rxTel = New-Object System.Text.RegularExpressions.Regex('href="tel:([^"]+)"', [System.Text.RegularExpressions.RegexOptions]::IgnoreCase)
$Phones = @()
foreach ($m in $rxTel.Matches($Html)) { $Phones += $m.Groups[1].Value }

# ── 5. Salvar JSON ──────────────────────────────────────────
Write-Log "Salvando JSON..."

$Data = [ordered]@{
    scraped_at       = (Get-Date -Format "yyyy-MM-ddTHH:mm:ss")
    source_url       = $PageUrl
    og_title         = $OgTitle
    og_description   = $OgDesc
    og_image         = $OgImage
    meta_description = $MetaD
    headings         = $Headings
    paragraphs       = $Paragraphs
    list_items       = ($ListItems | Select-Object -Unique)
    spans            = ($Spans | Select-Object -Unique)
    iframes          = ($Iframes | Select-Object -Unique)
    videos           = $Videos
    whatsapp_links   = ($WaLinks | Select-Object -Unique)
    phones           = ($Phones | Select-Object -Unique)
    images           = $Downloaded.ToArray()
    total_images     = $Downloaded.Count
}

$Json = $Data | ConvertTo-Json -Depth 10
[System.IO.File]::WriteAllText($DataFile, $Json, [System.Text.Encoding]::UTF8)

Write-Log ""
Write-Log "========================================="
Write-Log "  SCRAPING CONCLUIDO"
Write-Log "  Imagens       : $($Downloaded.Count)"
Write-Log "  Titulos       : $($Headings.Count)"
Write-Log "  Paragrafos    : $($Paragraphs.Count)"
Write-Log "  Itens lista   : $(($ListItems | Select-Object -Unique).Count)"
Write-Log "  Iframes       : $(($Iframes | Select-Object -Unique).Count)"
Write-Log "  Videos        : $($Videos.Count)"
Write-Log "  WhatsApp      : $(($WaLinks | Select-Object -Unique).Count)"
Write-Log "  Telefones     : $(($Phones | Select-Object -Unique).Count)"
Write-Log "  JSON salvo em : $DataFile"
Write-Log "========================================="
