# Network admin Noem Netra e2022117

This project runs four services with Docker Compose:

| Service | Description          | URL                     |
| ------- | -------------------- | ----------------------- |
| admin   | Flutter web admin app | http://localhost:8081   |
| client  | Flutter web client app| http://localhost:8082   |
| api     | nginx API entry page  | http://localhost:8000   |
| server  | Python HTTP server    | http://localhost:8083   |

## Run all services

From the repository root, run:

```powershell
.\run-all.ps1
```

The script builds both Flutter web apps and then starts every container.

If you prefer to run the steps manually:

```powershell
cd admin
flutter build web --release
cd ../client
flutter build web --release
cd ..
docker compose -f Server/Docker-compose.yml up --build -d
```

## Stop all services

```powershell
docker compose -f Server/Docker-compose.yml down
```

## Checking status

```powershell
docker compose -f Server/Docker-compose.yml ps
```
