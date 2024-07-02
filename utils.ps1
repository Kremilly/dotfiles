# Script PowerShell para instalar Chocolatey, Scoop, Nushell, Zoxide e Oh My Posh

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

# Instalar Scoop
if (-not (Test-Command "scoop")) {
    Invoke-Expression (New-Object System.Net.WebClient).DownloadString('https://get.scoop.sh');
} else {
    Write-Output "Scoop já está instalado."
}

# Instalar Nushell
if (-not (Test-Command "nu")) {
    scoop bucket add nushell https://github.com/nushell/nushell
    scoop install nushell
} else {
    Write-Output "Nushell já está instalado."
}

# Instalar Zoxide
if (-not (Test-Command "zoxide")) {
    scoop install zoxide
} else {
    Write-Output "Zoxide já está instalado."
}

# Instalar Oh My Posh via Scoop
if (-not (Test-Command "oh-my-posh")) {
    scoop install oh-my-posh
} else {
    Write-Output "Oh My Posh já está instalado."
}

# Configurar Oh My Posh para PowerShell
$profilePath = "$PROFILE"
if (-not (Test-Path -Path $profilePath)) {
    New-Item -ItemType File -Path $profilePath -Force
}

Add-Content -Path $profilePath -Value 'Import-Module oh-my-posh'
Add-Content -Path $profilePath -Value 'Set-PoshPrompt -Theme jandedobbeleer'

# Configurar Oh My Posh para Nushell
$nuConfigPath = "$env:USERPROFILE\Documents\nu\config.nu"
if (-not (Test-Path -Path $nuConfigPath)) {
    New-Item -ItemType File -Path $nuConfigPath -Force
}

Add-Content -Path $nuConfigPath -Value 'let $posh_init = ("oh-my-posh init nu") | save -raw | from json'
Add-Content -Path $nuConfigPath -Value 'source-env $posh_init.path'

Write-Output "Instalação concluída."
