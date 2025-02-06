variable "prefix" {
  type        = string
  description = "Resources name prefix"
}

variable "resource_group_location" {
  type        = string
  description = "Location of the resource group."
}

variable "vm_size" {
  type        = string
  description = "The size of the virtual machine."
}

variable "storage_image_reference_publisher" {
  type        = string
  description = "The publisher of the image used to create the virtual machine."
}

variable "storage_image_reference_offer" {
  type        = string
  description = "Specifies the offer of the platform image or marketplace image used to create the virtual machine."
}

variable "storage_image_reference_sku" {
  type        = string
  description = "Specifies the SKU of the platform image or marketplace image used to create the virtual machine."
}

variable "storage_image_reference_version" {
  type        = string
  description = "Specifies the version of the platform image or marketplace image used to create the virtual machine."
}

variable "storage_os_disk_caching" {
  type        = string
  description = "Specifies the caching requirements for the OS disk."
}

variable "storage_os_disk_create_option" {
  type        = string
  description = "Specifies how the virtual machine should be created."
}

variable "storage_os_disk_managed_disk_type" {
  type        = string
  description = "Specifies the storage account type for the managed disk."
}

variable "os_profile_admin_username" {
  type        = string
  description = "Specifies the name of the administrator account."
}

variable "os_profile_admin_password" {
  type        = string
  description = "Specifies the password of the administrator account."
}

variable "storage_account_replication" {
  type        = string
  description = "Specifies the replication type for this storage account."
}

variable "storage_account_tier" {
  type        = string
  description = "Specifies the tier to use for this storage account."
}

variable "custom_script_extension_enabled" {
  type        = bool
  description = "Specifies whether the extension should be enabled or disabled."
}

variable "image_resource_group_name" {
  type        = string
  description = "Specifies the name of the resource group that contains the image to use to create the virtual machine."
}

variable "subscription_id" {
  type        = string
  description = "Azure Subscription ID"
}
