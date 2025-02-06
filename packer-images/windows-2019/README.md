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

- Remove-Item -Path "$env:APPDATA\packer.d" -Recurse -Force
- $env:PACKER_LOG = "1"
- az group create --name "rg-packer-images-win" --location "northeurope"
- packer init .
- packer validate "./templates/windows-server2019-v1.pkr.hcl"

### Test Image

- From the root folder `windows-2019`
- terraform init
- terraform plan
- terraform apply
