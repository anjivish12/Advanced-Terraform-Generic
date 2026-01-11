variable "bastion" {
    type = map(object({
        subnet_name = string
        virtual_network_name = string
        pip_name = string

      name = string
      location = string
      resource_group_name = string
      ip_configuration = list(object({
        name = string
        
      }))
    }))
}
