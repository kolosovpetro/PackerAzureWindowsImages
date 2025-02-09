$ErrorActionPreference = "Stop"

Set-Location $PSScriptRoot

Write-Host "========================================================================================================================================"

$packerCacheExists = $( Test-Path "$env:APPDATA\packer.d" )

Write-Host "Attempting to delete cached packer plugins"

if ($packerCacheExists -eq $True)
{
    Write-Host "Removing Packer plugins directory..."
    Remove-Item -Path "$env:APPDATA\packer.d" -Recurse -Force
}

Write-Host "========================================================================================================================================"

Write-Host "Enabling Packer logging..."
$env:PACKER_LOG = "1"

Write-Host "========================================================================================================================================"

Write-Host "Creating Azure resource group 'rg-packer-images-win' in 'northeurope'..."
az group create --name "rg-packer-images-win" --location "northeurope"

Write-Host "========================================================================================================================================"

Write-Host "Initializing Packer..."
packer init .

Write-Host "========================================================================================================================================"

# Get all files in the folder and select the absolute path
$files = Get-ChildItem -Path ".\templates" -File | Select-Object -ExpandProperty FullName

# Iterate over the array of absolute paths
foreach ($file in $files)
{
    Write-Host "========================================================================================================================================"
    Write-Host "Validating template file: $file"
    packer validate "$file"
}

Write-Host "========================================================================================================================================"

Write-Host "Script execution completed."
