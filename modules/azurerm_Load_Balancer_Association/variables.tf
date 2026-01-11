variable "lbassoction" {
  type = map(object({
    nic_name              = string
    resource_group_name   = string
    lb_name               = string
    backendpool_name      = string
    ip_configuration_name = string
  }))
}

