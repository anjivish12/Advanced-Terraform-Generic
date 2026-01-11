variable "ag" {
  type = map(object({
    subnet_name = string
    pip_name = string
    virtual_network_name = string
    
    name                = string
    resource_group_name = string
    location            = string

    sku = list(object({
      name     = string
      tier     = string
      capacity = number
    }))
    gateway_ip_configuration = list(object({
      name = string
    }))
    frontend_port = list(object({
      name = string
    }))
    frontend_ip_configuration = list(object({
      name = string

    }))
    backend_address_pool = list(object({
      name = string
    }))
    backend_http_settings = list(object({
      name                  = string
      cookie_based_affinity = string
      path                  = string
      port                  = number
      protocol              = string
      request_timeout       = number
    }))
    http_listener = list(object({
      name                           = string
      frontend_ip_configuration_name = string
      frontend_port_name             = string
      protocol                       = string
      host_name = string

    }))
    request_routing_rule = list(object({
      name                       = string
      priority                   = number
      rule_type                  = string
      http_listener_name         = string
      backend_address_pool_name  = string
      backend_http_settings_name = string
    }))

  }))
}