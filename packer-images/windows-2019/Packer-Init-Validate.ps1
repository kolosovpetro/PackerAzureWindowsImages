$ErrorActionPreference = "Stop"

Write-Host "Removing Packer plugins directory..."
Remove-Item -Path "$env:APPDATA\packer.d" -Recurse -Force

Write-Host "Sleep 5 seconds"

Start-Sleep 5

Write-Host "Enabling Packer logging..."
$env:PACKER_LOG = "1"

Write-Host "========================================================================================================================================"

Write-Host "Creating Azure resource group 'rg-packer-images-win' in 'northeurope'..."
az group create --name "rg-packer-images-win" --location "northeurope"

Write-Host "========================================================================================================================================"

Write-Host "Initializing Packer..."
packer init .

Write-Host "========================================================================================================================================"

Write-Host "Validating Packer template: windows-server2019-v1.pkr.hcl..."
packer validate "./templates/windows-server2019-v1.pkr.hcl"

Write-Host "========================================================================================================================================"

Write-Host "Validating Packer template: windows-server2019-v2.pkr.hcl..."
packer validate "./templates/windows-server2019-v2.pkr.hcl"

Write-Host "========================================================================================================================================"

Write-Host "Script execution completed."
