# Packer Azure Windows Image

Example of how to create and deploy Azure Windows VM with preinstalled chocolatey and other software

## Provisioners used

- https://github.com/hashicorp/packer-plugin-azure
- https://github.com/rgl/packer-plugin-windows-update

## Install Packer (Windows Chocolatey)

- `choco install packer -y`

## Build Windows 2022 image

- Cleanup packer plugins folder
- `packer init windows-server2022-v1.pkr.hcl`
- `packer validate -var-file="windows.variables.json" windows-server2022-v1.pkr.hcl`
- `az group create --name rg-packer-win-2022 --location "northeurope"`
- `packer build -var-file="windows.variables.json" windows-server2022-v1.pkr.hcl`

## Build Windows 2019 image

- `packer init windows-server2019-v1.pkr.hcl`
- `packer validate -var-file="windows.variables.json" windows-server2019-v1.pkr.hcl`
- `packer build -var-file="windows.variables.json" windows-server2019-v1.pkr.hcl`
