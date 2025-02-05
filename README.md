# Packer Azure Windows Image

Example of how to create and deploy Azure Windows VM with preinstalled chocolatey and other software

### To install Packer

- `choco install packer -y`

### Packer commands

- `packer init windows-server2019-v1.pkr.hcl`
- `packer init windows-server2022-v1.pkr.hcl`
- `packer validate -var-file="windows.variables.json" windows-server2019-v1.pkr.hcl`
- `packer validate -var-file="windows.variables.json" windows-server2022-v1.pkr.hcl`
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

## Deploy storage account for terraform state

- See [CreateAzureStorageAccount.ps1](./CreateAzureStorageAccount.ps1)

# Module documentation

<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_azurerm"></a> [azurerm](#requirement\_azurerm) | =3.71.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_azurerm"></a> [azurerm](#provider\_azurerm) | 3.71.0 |

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_custom_script_extension"></a> [custom\_script\_extension](#module\_custom\_script\_extension) | ./modules/custom-script-extension | n/a |
| <a name="module_key_vault"></a> [key\_vault](#module\_key\_vault) | ./modules/keyvault | n/a |
| <a name="module_key_vault_secrets"></a> [key\_vault\_secrets](#module\_key\_vault\_secrets) | ./modules/keyvault-secrets | n/a |
| <a name="module_keyvault_access_policy"></a> [keyvault\_access\_policy](#module\_keyvault\_access\_policy) | ./modules/keyvault-access-policy | n/a |
| <a name="module_network"></a> [network](#module\_network) | ./modules/network | n/a |
| <a name="module_storage"></a> [storage](#module\_storage) | ./modules/storage | n/a |
| <a name="module_virtual_machine"></a> [virtual\_machine](#module\_virtual\_machine) | ./modules/vm | n/a |

## Resources

| Name | Type |
|------|------|
| [azurerm_resource_group.public](https://registry.terraform.io/providers/hashicorp/azurerm/3.71.0/docs/resources/resource_group) | resource |
| [azurerm_client_config.current](https://registry.terraform.io/providers/hashicorp/azurerm/3.71.0/docs/data-sources/client_config) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_azure-client-id"></a> [azure-client-id](#input\_azure-client-id) | n/a | `string` | n/a | yes |
| <a name="input_azure-client-secret"></a> [azure-client-secret](#input\_azure-client-secret) | n/a | `string` | n/a | yes |
| <a name="input_azure-region"></a> [azure-region](#input\_azure-region) | n/a | `string` | n/a | yes |
| <a name="input_azure-resource-group"></a> [azure-resource-group](#input\_azure-resource-group) | n/a | `string` | n/a | yes |
| <a name="input_azure-subscription-id"></a> [azure-subscription-id](#input\_azure-subscription-id) | n/a | `string` | n/a | yes |
| <a name="input_azure-tenant-id"></a> [azure-tenant-id](#input\_azure-tenant-id) | n/a | `string` | n/a | yes |
| <a name="input_custom_script_extension_enabled"></a> [custom\_script\_extension\_enabled](#input\_custom\_script\_extension\_enabled) | Specifies whether the extension should be enabled or disabled. | `bool` | n/a | yes |
| <a name="input_image-name"></a> [image-name](#input\_image-name) | n/a | `string` | n/a | yes |
| <a name="input_image_resource_group_name"></a> [image\_resource\_group\_name](#input\_image\_resource\_group\_name) | Specifies the name of the resource group that contains the image to use to create the virtual machine. | `string` | n/a | yes |
| <a name="input_os_profile_admin_password"></a> [os\_profile\_admin\_password](#input\_os\_profile\_admin\_password) | Specifies the password of the administrator account. | `string` | n/a | yes |
| <a name="input_os_profile_admin_username"></a> [os\_profile\_admin\_username](#input\_os\_profile\_admin\_username) | Specifies the name of the administrator account. | `string` | n/a | yes |
| <a name="input_prefix"></a> [prefix](#input\_prefix) | Resources name prefix | `string` | n/a | yes |
| <a name="input_resource_group_location"></a> [resource\_group\_location](#input\_resource\_group\_location) | Location of the resource group. | `string` | n/a | yes |
| <a name="input_storage_account_replication"></a> [storage\_account\_replication](#input\_storage\_account\_replication) | Specifies the replication type for this storage account. | `string` | n/a | yes |
| <a name="input_storage_account_tier"></a> [storage\_account\_tier](#input\_storage\_account\_tier) | Specifies the tier to use for this storage account. | `string` | n/a | yes |
| <a name="input_storage_image_reference_offer"></a> [storage\_image\_reference\_offer](#input\_storage\_image\_reference\_offer) | Specifies the offer of the platform image or marketplace image used to create the virtual machine. | `string` | n/a | yes |
| <a name="input_storage_image_reference_publisher"></a> [storage\_image\_reference\_publisher](#input\_storage\_image\_reference\_publisher) | The publisher of the image used to create the virtual machine. | `string` | n/a | yes |
| <a name="input_storage_image_reference_sku"></a> [storage\_image\_reference\_sku](#input\_storage\_image\_reference\_sku) | Specifies the SKU of the platform image or marketplace image used to create the virtual machine. | `string` | n/a | yes |
| <a name="input_storage_image_reference_version"></a> [storage\_image\_reference\_version](#input\_storage\_image\_reference\_version) | Specifies the version of the platform image or marketplace image used to create the virtual machine. | `string` | n/a | yes |
| <a name="input_storage_os_disk_caching"></a> [storage\_os\_disk\_caching](#input\_storage\_os\_disk\_caching) | Specifies the caching requirements for the OS disk. | `string` | n/a | yes |
| <a name="input_storage_os_disk_create_option"></a> [storage\_os\_disk\_create\_option](#input\_storage\_os\_disk\_create\_option) | Specifies how the virtual machine should be created. | `string` | n/a | yes |
| <a name="input_storage_os_disk_managed_disk_type"></a> [storage\_os\_disk\_managed\_disk\_type](#input\_storage\_os\_disk\_managed\_disk\_type) | Specifies the storage account type for the managed disk. | `string` | n/a | yes |
| <a name="input_vm-size"></a> [vm-size](#input\_vm-size) | n/a | `string` | n/a | yes |
| <a name="input_vm_size"></a> [vm\_size](#input\_vm\_size) | The size of the virtual machine. | `string` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_public_ip"></a> [public\_ip](#output\_public\_ip) | n/a |
| <a name="output_username"></a> [username](#output\_username) | n/a |
<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
