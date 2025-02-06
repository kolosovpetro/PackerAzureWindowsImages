# Packer Azure Windows Image

Example of how to create and deploy Azure Windows VM with preinstalled chocolatey and other software

### Install Packer (Windows Chocolatey)

- `choco install packer -y`

### Build Windows 2022 image

- Cleanup packer plugins folder
- `packer init windows-server2022-v1.pkr.hcl`
- `packer validate -var-file="windows.variables.json" windows-server2022-v1.pkr.hcl`
- `az group create --name rg-packer-win-2022 --location "northeurope"`
- `packer build -var-file="windows.variables.json" windows-server2022-v1.pkr.hcl`

### Build Windows 2019 image

- `packer init windows-server2019-v1.pkr.hcl`
- `packer validate -var-file="windows.variables.json" windows-server2019-v1.pkr.hcl`
- `packer build -var-file="windows.variables.json" windows-server2019-v1.pkr.hcl`

## Pre-commit configuration

- Install python3 via windows store
- `pip install --upgrade pip`
- `pip install pre-commit`
- Update PATH variable
- `pre-commit install`

## Install terraform docs

- `choco install terraform-docs`

## Install tflint

- `choco install tflint`

## Documentation

- https://github.com/antonbabenko/pre-commit-terraform
- https://github.com/kolosovpetro/AzureTerraformBackend
- https://github.com/terraform-docs/terraform-docs
- https://terraform-docs.io/user-guide/installation/
- https://pre-commit.com/

## Storage account configuration file

```bash
storage_account_name = "storage_account_name"
container_name       = "container_name"
key                  = "terraform.tfstate"
sas_token            = "sas_token"
```
