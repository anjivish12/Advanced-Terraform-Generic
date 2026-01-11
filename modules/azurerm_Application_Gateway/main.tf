
resource "azurerm_application_gateway" "ag" {
  for_each            = var.ag
  name                = each.value.name
  resource_group_name = each.value.resource_group_name
  location            = each.value.location

  dynamic "sku" {
    for_each = each.value.sku
    content {
      name     = sku.value.name
      tier     = sku.value.tier
      capacity = sku.value.capacity

    }

  }

  dynamic "gateway_ip_configuration" {
    for_each = each.value.gateway_ip_configuration
    content {
      name      = gateway_ip_configuration.value.name
      subnet_id = data.azurerm_subnet.subnetid[each.key].id

    }

  }

  dynamic "frontend_port" {
    for_each = each.value.frontend_port
    content {
      name = frontend_port.value.name
      port = 80

    }

  }

  dynamic "frontend_ip_configuration" {
    for_each = each.value.frontend_ip_configuration
    content {
      name                 = frontend_ip_configuration.value.name
      public_ip_address_id = data.azurerm_public_ip.pipid[each.key].id

    }

  }

  dynamic "backend_address_pool" {
    for_each = each.value.backend_address_pool
    content {
      name = backend_address_pool.value.name
    }
  }

  dynamic "backend_http_settings" {
    for_each = each.value.backend_http_settings
    content {
      name                  = backend_http_settings.value.name
      cookie_based_affinity = backend_http_settings.value.cookie_based_affinity
      path                  = backend_http_settings.value.path
      port                  = backend_http_settings.value.port
      protocol              = backend_http_settings.value.protocol
      request_timeout       = backend_http_settings.value.request_timeout
    }

  }

  dynamic "http_listener" {
    for_each = each.value.http_listener
    content {
      name                           = http_listener.value.name
      frontend_ip_configuration_name = http_listener.value.frontend_ip_configuration_name
      frontend_port_name             = http_listener.value.frontend_port_name
      protocol                       = http_listener.value.protocol

    }

  }

  dynamic "request_routing_rule" {
    for_each = each.value.request_routing_rule
    content {
      name                       = request_routing_rule.value.name
      priority                   = request_routing_rule.value.priority
      rule_type                  = request_routing_rule.value.rule_type
      http_listener_name         = request_routing_rule.value.http_listener_name
      backend_address_pool_name  = request_routing_rule.value.backend_address_pool_name
      backend_http_settings_name = request_routing_rule.value.backend_http_settings_name

    }

  }
}