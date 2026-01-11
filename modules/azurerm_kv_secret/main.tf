data "azurerm_key_vault" "key_vault" {
  for_each            = var.secrets
  name                = each.value.kv_name
  resource_group_name = each.value.rg_name
}

resource "azurerm_key_vault_secret" "key_vault_secret" {
  for_each         = var.secrets
  name             = each.value.secret_name
  value            = each.value.secret_value
  value_wo         = each.value.secret_value_wo
  value_wo_version = each.value.secret_value_wo_version
  key_vault_id     = data.azurerm_key_vault.key_vault[each.key].id
  content_type     = each.value.content_type
  not_before_date  = each.value.not_before_date
  expiration_date  = each.value.expiration_date
  tags             = each.value.tags
}
