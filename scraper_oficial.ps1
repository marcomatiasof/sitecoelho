$base   = "https://www.chateaujardin.com.br"
$outDir = "$PSScriptRoot\assets\images\oficial"
$vidDir = "$PSScriptRoot\assets\video"
$fntDir = "$PSScriptRoot\assets\fonts"

foreach ($d in @($outDir,$vidDir,$fntDir)) {
    if (!(Test-Path $d)) { New-Item -ItemType Directory -Path $d -Force | Out-Null }
}

function DL($url, $dest) {
    if (Test-Path $dest) { Write-Host "SKIP: $(Split-Path $dest -Leaf)"; return $true }
    try {
        $wc = New-Object System.Net.WebClient
        $wc.Headers.Add("User-Agent","Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 Chrome/124.0 Safari/537.36")
        $wc.Headers.Add("Referer","https://www.chateaujardin.com.br/")
        $wc.Headers.Add("Accept","image/webp,image/avif,image/*,*/*;q=0.8")
        $wc.DownloadFile($url, $dest)
        $kb = [Math]::Round((Get-Item $dest).Length/1KB,0)
        Write-Host "OK ${kb}KB: $(Split-Path $dest -Leaf)" -ForegroundColor Green
        return $true
    }
    catch {
        Write-Host "ERRO: $url" -ForegroundColor Red
        if (Test-Path $dest) { Remove-Item $dest -Force }
        return $false
    }
}

# VIDEO INSTITUCIONAL
Write-Host "`n=== VIDEO ===" -ForegroundColor Cyan
DL "$base/vite-build/assets/chateau-jardin-institucional.h264-yOdTQMJe.mp4" "$vidDir\chateau-jardin-institucional.mp4"

# LOGOS / FAVICON
Write-Host "`n=== LOGOS ===" -ForegroundColor Cyan
DL "$base/static/chateau_jardin_lp/chateau-icon-white.5e6ee75b509d.png"    "$outDir\logo-icon-white.png"
DL "$base/static/chateau_jardin_lp/og-image.fb365e2f52f6.png"              "$outDir\og-image-oficial.png"
DL "$base/static/chateau_jardin_lp/favicon-32.906188dec4b3.png"            "$outDir\favicon-32.png"
DL "$base/static/chateau_jardin_lp/favicon-192.0630c1c7e9c0.png"           "$outDir\favicon-192.png"
DL "$base/static/chateau_jardin_lp/apple-touch-icon.6dae61600aba.png"      "$outDir\apple-touch-icon.png"

# HERO WebP
Write-Host "`n=== HERO ===" -ForegroundColor Cyan
DL "$base/vite-build/assets/CHATEAU_JARDIN-PORTICO_LR-1-1-1-VAY-jJT8.webp" "$outDir\chateau-portico-hero.webp"

# MIDIAS DESTAQUE 2026-05
Write-Host "`n=== MIDIAS 2026 ===" -ForegroundColor Cyan
$mid = "$base/midias/chateau-jardin"
$d26 = @(
    "01-produto-teaser-poster-thumb.webp",
    "01-produto-poster-thumb.webp",
    "03-tour-lumiere-poster-thumb.webp"
)
foreach ($f in $d26) { DL "$mid/destaques-2026-05/$f" "$outDir\2026-$f" }

# MIDIAS DESTAQUE EDITOR
Write-Host "`n=== MIDIAS EDITOR ===" -ForegroundColor Cyan
$de = @(
    "01.exto-chateau-decorado-afa3859a-original-poster-thumb.webp",
    "harmonie-entrada-upscaled-b739317c-original-poster-thumb.webp",
    "03.tour-decorado-harmonie-5779e978-original-poster-thumb.webp",
    "decorado-355m-lateral-super-upscaled-bd32f7d5-original-poster-thumb.webp",
    "01.flavia-lazer-a50efabf-original-poster-thumb.webp"
)
foreach ($f in $de) { DL "$mid/destaques-editor/$f" "$outDir\editor-$f" }

# TENTAR VERSOES HI-RES (sem poster-thumb)
Write-Host "`n=== HI-RES ===" -ForegroundColor Cyan
$hires = @(
    "01.exto-chateau-decorado-afa3859a-original",
    "harmonie-entrada-upscaled-b739317c-original",
    "03.tour-decorado-harmonie-5779e978-original",
    "decorado-355m-lateral-super-upscaled-bd32f7d5-original",
    "01.flavia-lazer-a50efabf-original"
)
foreach ($f in $hires) {
    $ok = $false
    foreach ($ext in @(".webp",".jpg",".jpeg")) {
        if (!$ok) { $ok = DL "$mid/destaques-editor/$f$ext" "$outDir\hires-$f$ext" }
    }
}

# FONTES SELF-HOSTED
Write-Host "`n=== FONTES ===" -ForegroundColor Cyan
DL "$base/static/fonts/lato/lato-400-latin.e1b3b5908c9c.woff2"                                 "$fntDir\lato-400-latin.woff2"
DL "$base/static/fonts/cormorant-garamond/cormorant-garamond-variable-latin.c47ff12887a3.woff2" "$fntDir\cormorant-garamond-variable.woff2"
DL "$base/static/fonts/fonts.a8dfe01ef8c7.css"                                                 "$fntDir\fonts-oficial.css"

# RESUMO
Write-Host "`n=== RESUMO ===" -ForegroundColor Yellow
$imgs  = (Get-ChildItem $outDir -ErrorAction SilentlyContinue | Measure-Object -Property Length -Sum)
$vids  = (Get-ChildItem $vidDir -ErrorAction SilentlyContinue | Measure-Object -Property Length -Sum)
$fnts  = (Get-ChildItem $fntDir -ErrorAction SilentlyContinue | Measure-Object -Property Length -Sum)
$total = $imgs.Sum + $vids.Sum + $fnts.Sum
Write-Host "Imagens: $($imgs.Count) arquivos"
Write-Host "Videos:  $($vids.Count) arquivos"
Write-Host "Fontes:  $($fnts.Count) arquivos"
Write-Host "Total:   $([Math]::Round($total/1MB,1)) MB" -ForegroundColor Green

Write-Host "`nArquivos baixados:" -ForegroundColor Cyan
Get-ChildItem $outDir | Select-Object Name,@{N="KB";E={[Math]::Round($_.Length/1KB,0)}} | Format-Table -AutoSize
