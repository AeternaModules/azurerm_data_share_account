resource "azurerm_data_share_account" "data_share_accounts" {
  for_each = var.data_share_accounts

  location            = each.value.location
  name                = each.value.name
  resource_group_name = each.value.resource_group_name
  tags                = each.value.tags

  identity {
    type = each.value.identity.type
  }
}

