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

Write-Host "Enviando para o GitHub (push)..."
Write-Host "ATENÇÃO: Pode aparecer uma janela pedindo para você logar na sua conta do GitHub." -ForegroundColor Yellow
& $gitPath push -u origin main --force

Write-Host "Pronto! Acesse seu GitHub e veja se os arquivos estão lá." -ForegroundColor Green
