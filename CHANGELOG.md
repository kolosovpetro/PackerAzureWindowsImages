# Changelog

All notable changes to this project will be documented in this file.

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/),
and this project adheres to [Semantic Versioning v2.0.0](https://semver.org/spec/v2.0.0.html).

## v1.1.0 - In Progress

### Changed

- Windows 2022 base image for `windows-server2022-v4.pkr.hcl`
- Windows 2019 base image for `windows-server2019-v4.pkr.hcl`
- Verifies image Windows Server images integrity using `scf scan` and `DISM`
- Configures WinRM for Ansible as part of images
- Images are tested using Terraform
- Add encoding fix PowerShell script (removes BOM and fixes EOL)
- Arrange images folder structure for better code maintainability
- Each image contains `README` file with complete guide how to build it
- Add PowerShell script for Packer init and validate images
- Merge images directories
- Merge all images to a single folder, parametrize base image
- Update Packer init script, run validate over all files in folder templates
- Create a powershell script that builds packer images using var files and templates, use absolute paths there
- Update readme with all commands to build images

**Installed software v1**

- microsoft-edge
- git
- netfx-4.8-devpack
- dotnet-6.0-sdk
- powershell-core
- winrar
- notepadplusplus
- azcopy10

## v1.0.0 - In Progress

### Changed

- azure-cli
- microsoft-edge
- git
- netfx-4.8-devpack
- dotnet-6.0-sdk
- openssl
- powershell-core
- winrar
- notepadplusplus
- nvm
