

resource "azurerm_mssql_server" "mysql_server" {

  for_each = var.servers

  name                         = each.value.name
  resource_group_name          = each.value.resource_group_name
  location                     = each.value.location
  version                      = each.value.version
  administrator_login          = each.value.administrator_login
  administrator_login_password = each.value.administrator_login_password
  minimum_tls_version          = each.value.minimum_tls_version
  public_network_access_enabled = true

  # Azure AD Administrator configuration
  dynamic "azuread_administrator" {
    for_each = each.value.azuread_administrator == null ? [] : each.value.azuread_administrator
    content {
      login_username              = azuread_administrator.value.login_username
      object_id                   = azuread_administrator.value.object_id
      tenant_id                   = azuread_administrator.value.tenant_id
      azuread_authentication_only = azuread_administrator.value.azuread_authentication_only
    }
  }

  # Managed Identity configuration
  dynamic "identity" {
    for_each = each.value.identity == null ? [] : [each.value.identity]
    content {
      type         = identity.value.type
      identity_ids = identity.value.identity_ids
    }
  }

  # Optional tags
  tags = each.value.tags
}
