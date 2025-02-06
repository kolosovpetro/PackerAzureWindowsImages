terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = ">=3.71.0"
    }
  }

  backend "azurerm" {}
}

provider "azurerm" {
  features {
    resource_group {
      prevent_deletion_if_contains_resources = false
    }
  }
  subscription_id = var.subscription_id
}

resource "azurerm_resource_group" "public" {
  location = var.resource_group_location
  name     = "rg-packer-test2019-${var.prefix}"
}

module "network" {
  source                  = "../../modules/network"
  resource_group_location = azurerm_resource_group.public.location
  resource_group_name     = azurerm_resource_group.public.name
  subnet_name             = "vm-win-subnet-${var.prefix}"
  vnet_name               = "vm-win-vnet-${var.prefix}"
}

module "virtual_machine" {
  source                            = "../../modules/vm"
  ip_configuration_name             = "vm-win-ip-config-${var.prefix}"
  network_interface_name            = "vm-win-nic-${var.prefix}"
  os_profile_admin_password         = var.os_profile_admin_password
  os_profile_admin_username         = var.os_profile_admin_username
  os_profile_computer_name          = "vm-win-${var.prefix}"
  public_ip_name                    = "vm-win-ip-${var.prefix}"
  resource_group_location           = azurerm_resource_group.public.location
  resource_group_name               = azurerm_resource_group.public.name
  storage_image_reference_offer     = var.storage_image_reference_offer
  image_resource_group_name         = var.image_resource_group_name
  storage_image_reference_publisher = var.storage_image_reference_publisher
  storage_image_reference_sku       = var.storage_image_reference_sku
  storage_image_reference_version   = var.storage_image_reference_version
  storage_os_disk_caching           = var.storage_os_disk_caching
  storage_os_disk_create_option     = var.storage_os_disk_create_option
  storage_os_disk_managed_disk_type = var.storage_os_disk_managed_disk_type
  storage_os_disk_name              = "vm-win-os-disk-${var.prefix}"
  subnet_id                         = module.network.subnet_id
  vm_name                           = "vm-win-${var.prefix}"
  vm_size                           = var.vm_size
  nsg_name                          = "vm-win-nsg-${var.prefix}"
}
