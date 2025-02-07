resource "azurerm_storage_account" "public" {
  name                     = var.storage_account_name
  location                 = var.storage_location
  resource_group_name      = var.storage_resource_group_name
  account_tier             = var.storage_account_tier
  account_replication_type = var.storage_account_replication
}

resource "azurerm_storage_container" "public" {
  name                  = var.storage_container_name
  storage_account_id    = azurerm_storage_account.public.id
  container_access_type = "blob"

  depends_on = [azurerm_storage_account.public]
}
