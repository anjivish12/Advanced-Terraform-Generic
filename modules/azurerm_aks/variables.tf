variable "aks" {
    type = map(object({
      name = string
      resource_group_name = string
      location = string
      dns_prefix = string
      default_node_pool = list(object({
        name = string
        node_count = number
        vm_size = string 
      }))
      identity = list(object({
        type = string
      }))
    }))  
}