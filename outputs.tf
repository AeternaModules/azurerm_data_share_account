output "data_share_accounts_id" {
  description = "Map of id values across all data_share_accounts, keyed the same as var.data_share_accounts"
  value       = { for k, v in azurerm_data_share_account.data_share_accounts : k => v.id }
}
output "data_share_accounts_identity" {
  description = "Map of identity values across all data_share_accounts, keyed the same as var.data_share_accounts"
  value       = { for k, v in azurerm_data_share_account.data_share_accounts : k => v.identity }
}
output "data_share_accounts_location" {
  description = "Map of location values across all data_share_accounts, keyed the same as var.data_share_accounts"
  value       = { for k, v in azurerm_data_share_account.data_share_accounts : k => v.location }
}
output "data_share_accounts_name" {
  description = "Map of name values across all data_share_accounts, keyed the same as var.data_share_accounts"
  value       = { for k, v in azurerm_data_share_account.data_share_accounts : k => v.name }
}
output "data_share_accounts_resource_group_name" {
  description = "Map of resource_group_name values across all data_share_accounts, keyed the same as var.data_share_accounts"
  value       = { for k, v in azurerm_data_share_account.data_share_accounts : k => v.resource_group_name }
}
output "data_share_accounts_tags" {
  description = "Map of tags values across all data_share_accounts, keyed the same as var.data_share_accounts"
  value       = { for k, v in azurerm_data_share_account.data_share_accounts : k => v.tags }
}

