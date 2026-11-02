# Build both Flutter web apps and start every service with Docker Compose.
$ErrorActionPreference = "Stop"
$root = Split-Path -Parent $MyInvocation.MyCommand.Path

Write-Host "Building admin Flutter web app..." -ForegroundColor Cyan
Push-Location (Join-Path $root "admin")
flutter build web --release
Pop-Location

Write-Host "Building client Flutter web app..." -ForegroundColor Cyan
Push-Location (Join-Path $root "client")
flutter build web --release
Pop-Location

Write-Host "Starting all services..." -ForegroundColor Cyan
docker compose -f (Join-Path $root "Server/Docker-compose.yml") up --build -d

Write-Host ""
Write-Host "Services:" -ForegroundColor Green
Write-Host "  Admin  -> http://localhost:8081"
Write-Host "  Client -> http://localhost:8082"
Write-Host "  API    -> http://localhost:8000"
Write-Host "  Server -> http://localhost:8080"
