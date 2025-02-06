$ErrorActionPreference = "Stop"

Write-Host "Removing Packer plugins directory..."
Remove-Item -Path "$env:APPDATA\packer.d" -Recurse -Force

Write-Host "Enabling Packer logging..."
$env:PACKER_LOG = "1"

Write-Host "Creating Azure resource group 'rg-packer-images-win' in 'northeurope'..."
az group create --name "rg-packer-images-win" --location "northeurope"

Write-Host "Initializing Packer..."
packer init .

Write-Host "Validating Packer template: windows-server2022-v1.pkr.hcl..."
packer validate "./templates/windows-server2022-v1.pkr.hcl"

Write-Host "Validating Packer template: windows-server2022-v2.pkr.hcl..."
packer validate "./templates/windows-server2022-v2.pkr.hcl"

Write-Host "Script execution completed."
