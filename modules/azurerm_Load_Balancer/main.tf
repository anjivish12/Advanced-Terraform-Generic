


resource "azurerm_lb" "load_balancer" {
    for_each = var.lb
  name                = each.value.lb_name
  location            = each.value.location
  resource_group_name = each.value.resource_group_name

  dynamic "frontend_ip_configuration" {
    for_each = each.value.frontend_ip_configuration
    content {
      name = frontend_ip_configuration.value.frontend_ip_configuration_name
      public_ip_address_id = data.azurerm_public_ip.pip[each.key].id
    }
   
  }
}

resource "azurerm_lb_backend_address_pool" "backend_pool" {
    for_each = var.lb
  loadbalancer_id = azurerm_lb.load_balancer[each.key].id
  name            = each.value.backendpool_name
}

resource "azurerm_lb_probe" "health_probe" {
    for_each = var.lb
  loadbalancer_id = azurerm_lb.load_balancer[each.key].id
  name            = each.value.healthprobe_name
  port            = each.value.port
}

resource "azurerm_lb_rule" "rule" {
    for_each = var.lb
  loadbalancer_id                = azurerm_lb.load_balancer[each.key].id
  name                           = each.value.rule_name
  protocol                       = each.value.protocol
  frontend_port                  = each.value.frontend_port
  backend_port                   = each.value.backend_port
  frontend_ip_configuration_name = each.value.frontend_ip_configuration_name
  backend_address_pool_ids  = [azurerm_lb_backend_address_pool.backend_pool[each.key].id]
  probe_id = azurerm_lb_probe.health_probe[each.key].id
}