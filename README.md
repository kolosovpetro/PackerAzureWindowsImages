# Packer Azure Windows Image

Example of how to create and deploy Azure Windows VM with preinstalled chocolatey and other software

## Provisioners used

- https://github.com/hashicorp/packer-plugin-azure
- https://github.com/rgl/packer-plugin-windows-update

## Terraform modules in this repository

- custom-script-extension
- vm
- storage
- network
- keyvault-secrets
- keyvault-access-policy
- keyvault
