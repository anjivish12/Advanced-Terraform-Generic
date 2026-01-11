


resource "azurerm_network_interface_backend_address_pool_association" "association" {

  for_each                = var.lbassoction
  network_interface_id    = data.azurerm_network_interface.nic[each.key].id
  ip_configuration_name   = each.value.ip_configuration_name
  backend_address_pool_id = data.azurerm_lb_backend_address_pool.backendpool[each.key].id
}