# Packer Azure Windows Image

Packer-based automation for building Azure Windows Server images. Supports Windows Server 2019 & 2022 with pre-installed
tools like Azure CLI, PowerShell Core, and SQL Server Management Studio. Ensures integrity with scf scan & DISM,
configures WinRM for Ansible, and validates images with Terraform.

## Provisioners used

- https://github.com/hashicorp/packer-plugin-azure
- https://github.com/rgl/packer-plugin-windows-update

## Installed software v4

- azure-cli
- microsoft-edge
- git
- netfx-4.8-devpack
- dotnet-6.0-sdk
- powershell-core
- winrar
- notepadplusplus
- sql-server-management-studio
- azcopy10

## Terraform modules in this repository

- custom-script-extension
- vm
- storage
- network
- keyvault-secrets
- keyvault-access-policy
- keyvault
