resource "azurerm_storage_account" "ml_storage" {
  name                     = "mlstorageacct123"
  resource_group_name      = azurerm_resource_group.ml_rg.name
  location                 = azurerm_resource_group.ml_rg.location
  account_tier             = "Standard"
  account_replication_type = "LRS"
}

resource "azurerm_storage_container" "ml_container" {
  name                  = "ml-artifacts"
  container_access_type = "private"
}
