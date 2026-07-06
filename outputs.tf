output "data_share_accounts" {
  description = "All data_share_account resources"
  value       = azurerm_data_share_account.data_share_accounts
}
output "data_share_accounts_identity" {
  description = "List of identity values across all data_share_accounts"
  value       = [for k, v in azurerm_data_share_account.data_share_accounts : v.identity]
}
output "data_share_accounts_location" {
  description = "List of location values across all data_share_accounts"
  value       = [for k, v in azurerm_data_share_account.data_share_accounts : v.location]
}
output "data_share_accounts_name" {
  description = "List of name values across all data_share_accounts"
  value       = [for k, v in azurerm_data_share_account.data_share_accounts : v.name]
}
output "data_share_accounts_resource_group_name" {
  description = "List of resource_group_name values across all data_share_accounts"
  value       = [for k, v in azurerm_data_share_account.data_share_accounts : v.resource_group_name]
}
output "data_share_accounts_tags" {
  description = "List of tags values across all data_share_accounts"
  value       = [for k, v in azurerm_data_share_account.data_share_accounts : v.tags]
}

