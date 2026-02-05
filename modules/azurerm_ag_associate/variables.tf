variable "agassociate" {
    type = map(object({
        nic_name = string
        ag_name = string
        ip_configuration_name = string
        resource_group_name = string
    }))
  
}