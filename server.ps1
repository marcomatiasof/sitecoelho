$port = 8080
$root = $PSScriptRoot

$listener = New-Object System.Net.HttpListener
$listener.Prefixes.Add("http://localhost:$port/")
$listener.Start()

Write-Host "Servidor rodando em http://localhost:$port/"
Write-Host "Pressione Ctrl+C para parar."

try {
    while ($listener.IsListening) {
        $context = $listener.GetContext()
        $request = $context.Request
        $response = $context.Response

        $urlPath = $request.Url.LocalPath.TrimStart('/')
        if ([string]::IsNullOrEmpty($urlPath)) {
            $urlPath = "index.html"
        }

        $filePath = [System.IO.Path]::Combine($root, $urlPath)
        $filePath = [System.IO.Path]::GetFullPath($filePath)

        # Basic security check
        if (!$filePath.StartsWith($root)) {
            $response.StatusCode = 403
            $response.Close()
            continue
        }

        if (Test-Path $filePath -PathType Leaf) {
            $ext = [System.IO.Path]::GetExtension($filePath).ToLower()
            $mime = switch ($ext) {
                ".html" { "text/html; charset=utf-8" }
                ".css"  { "text/css" }
                ".js"   { "application/javascript" }
                ".png"  { "image/png" }
                ".jpg"  { "image/jpeg" }
                ".jpeg" { "image/jpeg" }
                ".webp" { "image/webp" }
                ".mp4"  { "video/mp4" }
                ".woff2" { "font/woff2" }
                default { "application/octet-stream" }
            }

            try {
                $response.ContentType = $mime
                $fileStream = [System.IO.File]::OpenRead($filePath)
                $response.ContentLength64 = $fileStream.Length
                $fileStream.CopyTo($response.OutputStream)
                $fileStream.Close()
                $response.StatusCode = 200
                Write-Host "200 OK: $urlPath"
            } catch {
                $response.StatusCode = 500
                Write-Host "500 ERRO: $urlPath" -ForegroundColor Red
            }
        } else {
            $response.StatusCode = 404
            Write-Host "404 NOT FOUND: $urlPath" -ForegroundColor Yellow
        }
        $response.Close()
    }
} finally {
    $listener.Stop()
    $listener.Close()
}
