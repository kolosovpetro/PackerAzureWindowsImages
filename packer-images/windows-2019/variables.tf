variable "storage_image_reference_sku" {
  type        = string
  description = "Specifies the SKU of the platform image or marketplace image used to create the virtual machine."
  default     = "windows-server2019-v2"
}

variable "image_resource_group_name" {
  type        = string
  description = "Specifies the name of the resource group that contains the image to use to create the virtual machine."
  default     = "rg-packer-images-win"
}

variable "os_profile_admin_password" {
  type        = string
  description = "Specifies the password of the administrator account."
  default     = "2HiVkwYAx0VKJoAC"
}

variable "prefix" {
  type        = string
  description = "Resources name prefix"
  default     = "d01"
}

variable "resource_group_location" {
  type        = string
  description = "Location of the resource group."
  default     = "northeurope"
}

variable "vm_size" {
  type        = string
  description = "The size of the virtual machine."
  default     = "Standard_D4s_v3"
}

variable "storage_os_disk_caching" {
  type        = string
  description = "Specifies the caching requirements for the OS disk."
  default     = "ReadWrite"
}

variable "storage_os_disk_create_option" {
  type        = string
  description = "Specifies how the virtual machine should be created."
  default     = "FromImage"
}

variable "storage_os_disk_managed_disk_type" {
  type        = string
  description = "Specifies the storage account type for the managed disk."
  default     = "Premium_LRS"
}

variable "os_profile_admin_username" {
  type        = string
  description = "Specifies the name of the administrator account."
  default     = "razumovsky_r"
}

variable "subscription_id" {
  type        = string
  description = "Azure Subscription ID"
  default     = "f32f6566-8fa0-4198-9c91-a3b8ac69e89a"
}
