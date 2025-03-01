# Packer Azure Windows Image

Packer-based automation for building Azure Windows Server images. Supports Windows Server 2019 & 2022 with pre-installed
tools like Azure CLI, PowerShell Core, and SQL Server Management Studio. Ensures integrity with scf scan & DISM,
configures WinRM for Ansible, and validates images with Terraform.

## Provisioners used

- https://github.com/hashicorp/packer-plugin-azure
- https://github.com/rgl/packer-plugin-windows-update

## Installed software v1

- `choco feature enable -n allowGlobalConfirmation`
- `IIS`
- `Chocolatey`
- `choco install microsoft-edge -y`
- `choco install git.install -y`
- `choco install netfx-4.8-devpack -y`
- `choco install dotnet-6.0-sdk -y`
- `choco install powershell-core -y`
- `choco install winrar -y`
- `choco install notepadplusplus -y`
- `choco install azcopy10 -y`

## Installed software v2

- `choco feature enable -n allowGlobalConfirmation`
- `IIS`
- `Chocolatey`
- `choco install microsoft-edge -y`
- `choco install git.install -y`
- `choco install netfx-4.8-devpack -y`
- `choco install dotnet-6.0-sdk -y`
- `choco install powershell-core -y`
- `choco install winrar -y`
- `choco install notepadplusplus -y`
- `choco install azcopy10 -y`
- `Prometheus node exporter`
