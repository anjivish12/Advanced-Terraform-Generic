variable "lb" {
  type = map(object({
    pip_name            = string
    lb_name             = string
    resource_group_name = string
    location            = string
    frontend_ip_configuration = list(object({
      frontend_ip_configuration_name = string
    }))
    backendpool_name               = string
    healthprobe_name               = string
    port                           = number
    rule_name                      = string
    protocol                       = string
    frontend_port                  = number
    backend_port                   = number
    frontend_ip_configuration_name = string
  }))

}