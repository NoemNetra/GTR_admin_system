
Write-Host "Starting Netra System..." -ForegroundColor Cyan

$composeFile = Join-Path $PSScriptRoot "Server\docker-compose.yml"

if (!(Test-Path $composeFile)) {
    Write-Host "Docker Compose file not found: $composeFile" -ForegroundColor Red
    exit 1
}

docker compose -f $composeFile up --build -d

if ($LASTEXITCODE -ne 0) {
    Write-Host "Docker failed to start!" -ForegroundColor Red
    exit 1
}

Write-Host "Waiting for services..." -ForegroundColor Yellow
Start-Sleep -Seconds 5

docker compose -f $composeFile ps

Start-Process "http://localhost:8066"
Start-Process "http://localhost:8067"

Write-Host "Admin: http://localhost:8066" -ForegroundColor Green
Write-Host "Client: http://localhost:8067" -ForegroundColor Green
