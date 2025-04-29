output "client_config" {
  value = {
    client_id       = data.azurerm_client_config.current.client_id
    tenant_id       = data.azurerm_client_config.current.tenant_id
    subscription_id = data.azurerm_client_config.current.subscription_id
  }
}

output "resource_group_name" {
  value = azurerm_resource_group.example.name
}

output "application_insights_id" {
  value = azurerm_application_insights.example.id
}

output "key_vault_id" {
  value = azurerm_key_vault.example.id
}

output "storage_account_id" {
  value = azurerm_storage_account.example.id
}

output "ml_workspace_id" {
  value = azurerm_machine_learning_workspace.example.id
}

output "ml_workspace_name" {
  value = azurerm_machine_learning_workspace.example.name
}
