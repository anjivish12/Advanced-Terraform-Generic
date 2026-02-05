
data "azurerm_network_interface" "agnicid" {
  for_each = var.agassociate
  name                = each.value.nic_name
  resource_group_name = each.value.resource_group_name
}

data "azurerm_application_gateway" "ag" {
  for_each = var.agassociate
  name                = each.value.ag_name
  resource_group_name = each.value.resource_group_name

}