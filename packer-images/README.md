# Packer Azure Image Builder

This repository contains a Packer template to build a custom Windows Server 2022 image on Microsoft Azure.

## Prerequisites

- Packer installed (https://developer.hashicorp.com/packer/downloads)
- Azure CLI installed and authenticated (`az login`)
- Service principal with necessary permissions

## Setup & Build

### Authenticate to Azure

- az login
- az account set --subscription <subscription-id>

### Build image (Run from the folder where `versions.hcl` file located)

- Setup required environment variables
- `.\Packer-Init-Validate.ps1`
- .\Packer-Build.ps1 -PackerImage ".\templates\windows-server-image-v1.pkr.hcl" -VarFile ".\packer.windows2019.pkolosov.vars.json"
- .\Packer-Build.ps1 -PackerImage ".\templates\windows-server-image-v1.pkr.hcl" -VarFile ".\packer.windows2022.pkolosov.vars.json"
- .\Packer-Build.ps1 -PackerImage ".\templates\windows-server-image-v1.pkr.hcl" -VarFile ".\packer.windows2019.osds.vars.json"
- .\Packer-Build.ps1 -PackerImage ".\templates\windows-server-image-v1.pkr.hcl" -VarFile ".\packer.windows2022.osds.vars.json"

### Test Image

- From the root folder `windows-2019`
- `terraform init`
- `terraform plan`
- `terraform apply`
