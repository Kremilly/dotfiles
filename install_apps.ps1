# Script PowerShell para instalar Google Chrome, Postman, VSCode, Visual Studio, Docker, ClickUp e Microsoft Teams

# Função para verificar se um comando existe
function Test-Command {
    param(
        [string]$command
    )
    $commandPath = (Get-Command $command -ErrorAction SilentlyContinue)
    return $commandPath -ne $null
}

# Instalar Chocolatey
if (-not (Test-Command "choco")) {
    Set-ExecutionPolicy Bypass -Scope Process -Force;
    [System.Net.ServicePointManager]::SecurityProtocol = [System.Net.ServicePointManager]::SecurityProtocol -bor 3072;
    iex ((New-Object System.Net.WebClient).DownloadString('https://community.chocolatey.org/install.ps1'));
} else {
    Write-Output "Chocolatey já está instalado."
}

# Instalar Google Chrome
if (-not (Test-Command "chrome")) {
    choco install googlechrome -y
} else {
    Write-Output "Google Chrome já está instalado."
}

# Instalar Postman
if (-not (Test-Command "postman")) {
    choco install postman -y
} else {
    Write-Output "Postman já está instalado."
}

# Instalar Visual Studio Code
if (-not (Test-Command "code")) {
    choco install vscode -y
} else {
    Write-Output "Visual Studio Code já está instalado."
}

# Instalar Visual Studio 2019 Community
if (-not (Test-Command "devenv")) {
    choco install visualstudio2019community -y
} else {
    Write-Output "Visual Studio 2019 Community já está instalado."
}

# Instalar Docker Desktop
if (-not (Test-Command "docker")) {
    choco install docker-desktop -y
} else {
    Write-Output "Docker Desktop já está instalado."
}

# Instalar ClickUp
if (-not (Test-Command "clickup")) {
    choco install clickup -y
} else {
    Write-Output "ClickUp já está instalado."
}

# Instalar Microsoft Teams
if (-not (Test-Command "teams")) {
    choco install microsoft-teams -y
} else {
    Write-Output "Microsoft Teams já está instalado."
}

Write-Output "Instalação concluída."
