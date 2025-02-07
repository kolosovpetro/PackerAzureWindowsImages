variable "azure-client-id" {
  type = string
  default = env("PACKER_MPN_SUB_CLIENT_ID")
}

variable "azure-client-secret" {
  type = string
  default = env("PACKER_MPN_SUB_CLIENT_SECRET")
}

variable "azure-subscription-id" {
  type = string
  default = env("PACKER_MPN_SUB_ID")
}

variable "azure-tenant-id" {
  type = string
  default = env("PACKER_MPN_SUB_TENANT_ID")
}

variable "azure-region" {
  type    = string
  default = "northeurope"
}

variable "azure-resource-group" {
  type    = string
  default = "rg-packer-images-win"
}

variable "vm-size" {
  type    = string
  default = "Standard_D4s_v3"
}

variable "image-name" {
  type    = string
  default = "windows-server2022-v3"
}

source "azure-arm" "autogenerated_1" {
  client_id                          = var.azure-client-id
  client_secret                      = var.azure-client-secret
  communicator                       = "winrm"
  image_offer                        = "WindowsServer"
  image_publisher                    = "MicrosoftWindowsServer"
  image_sku                          = "2022-Datacenter"
  location                           = var.azure-region
  managed_image_name                 = var.image-name
  managed_image_resource_group_name  = var.azure-resource-group
  os_type                            = "Windows"
  subscription_id                    = var.azure-subscription-id
  tenant_id                          = var.azure-tenant-id
  vm_size                            = var.vm-size
  winrm_insecure                     = true
  winrm_timeout                      = "3m"
  winrm_use_ssl                      = true
  winrm_username                     = "packer"
  managed_image_storage_account_type = "Premium_LRS"
}

build {
  sources = ["source.azure-arm.autogenerated_1"]

  provisioner "windows-update" {
  }

  provisioner "windows-restart" {
    restart_timeout = "15m"
  }

  provisioner "windows-update" {
  }

  provisioner "windows-restart" {
    restart_timeout = "15m"
  }

  provisioner "powershell" {
    script = "scripts/Install-IIS.ps1"
  }

  provisioner "powershell" {
    script = "scripts/Install-Chocolatey.ps1"
  }

  provisioner "windows-restart" {
    restart_timeout = "15m"
  }

  provisioner "powershell" {
    script = "scripts/Install-Chocolatey.ps1"
  }

  provisioner "powershell" {
    script = "scripts/Install-Software-Win2022.ps1"
  }

  provisioner "windows-restart" {
    restart_timeout = "15m"
  }

  provisioner "windows-update" {
  }

  provisioner "windows-restart" {
    restart_timeout = "15m"
  }

  provisioner "powershell" {
    script = "scripts/Configure-WinRM.ps1"
  }

  provisioner "powershell" {
    script = "scripts/Execute-Regedit.ps1"
  }

  provisioner "windows-restart" {
    restart_timeout = "15m"
  }

  provisioner "powershell" {
    script = "scripts/Execute-Sysprep.ps1"
  }
}
