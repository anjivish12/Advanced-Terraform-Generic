data "azurerm_subnet" "subnetid" {
  for_each             = var.ag
  name                 = each.value.subnet_name
  virtual_network_name = each.value.virtual_network_name
  resource_group_name  = each.value.resource_group_name
}

data "azurerm_public_ip" "pipid" {
  for_each            = var.ag
  name                = each.value.pip_name
  resource_group_name = each.value.resource_group_name
}