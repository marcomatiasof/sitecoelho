$gitPath = "C:\Program Files\Git\cmd\git.exe"

if (-not (Test-Path $gitPath)) {
    Write-Host "Git ainda não foi instalado ou o caminho é diferente." -ForegroundColor Red
    exit
}

Write-Host "Inicializando repositório Git..."
& $gitPath init

Write-Host "Configurando remetente (GitHub)..."
& $gitPath remote remove origin 2>$null
& $gitPath remote add origin "https://github.com/marcomatiasof/sitecoelho.git"
& $gitPath branch -M main

Write-Host "Adicionando todos os arquivos..."
& $gitPath add .

Write-Host "Criando o commit (salvando as mudanças)..."
& $gitPath commit -m "🚀 Deploy inicial automático da Landing Page Château Jardin"

Write-Host "Enviando para o GitHub (https://github.com/marcomatiasof/sitecoelho)..." -ForegroundColor Cyan
Write-Host "Pode aparecer uma janela no seu navegador para você confirmar o login do GitHub." -ForegroundColor Yellow
& git push -u origin main

Write-Host "Concluído com sucesso! Verifique em https://github.com/marcomatiasof/sitecoelho" -ForegroundColor Green
