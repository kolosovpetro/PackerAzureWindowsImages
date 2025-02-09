$ErrorActionPreference = "Stop"

function PrintLongDash()
{
    Write-Host "========================================================================================================================================"
}

Set-Location $PSScriptRoot

PrintLongDash

$packerCacheExists = $( Test-Path "$env:APPDATA\packer.d" )

Write-Host "Attempting to delete cached packer plugins"

if ($packerCacheExists -eq $True)
{
    Write-Host "Removing Packer plugins directory..."
    Remove-Item -Path "$env:APPDATA\packer.d" -Recurse -Force
}

PrintLongDash

Write-Host "Enabling Packer logging..."
$env:PACKER_LOG = "1"

PrintLongDash

Write-Host "Creating Azure resource group 'rg-packer-images-win' in 'northeurope'..."
az group create --name "rg-packer-images-win" --location "northeurope"

PrintLongDash

Write-Host "Initializing Packer..."
packer init .

PrintLongDash

# Get all files in the folder and select the absolute path
$files = Get-ChildItem -Path ".\templates" -File | Select-Object -ExpandProperty FullName

# Iterate over the array of absolute paths
foreach ($file in $files)
{
    PrintLongDash
    Write-Host "Validating template file: $file"
    packer validate "$file"
}

PrintLongDash

Write-Host "Script execution completed."
