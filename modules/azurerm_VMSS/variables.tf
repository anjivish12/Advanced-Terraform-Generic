variable "vmss" {
    type = map(object({
      ag_name = string
      subnet_name = string
      virtual_network_name = string
      name = string
      location = string
      resource_group_name = string
      sku = string
      instances = number
      admin_username = string
      admin_password = string
      disable_password_authentication = bool
      source_image_reference = list(object({
        publisher = string
        offer = string
        sku = string
        version = string 
      }))
      os_disk = list(object({
        storage_account_type = string
        caching = string
      }))
      network_interface = list(object({
        name = string
        primary = string
        ip_configuration = list(object({
          name = string
          primary = string
        }))
      }))
    }))
}
