variable "servers" {
    
    type = map(object({
    name                         = string
    resource_group_name          = string
    location                     = string
    version                      = string
    administrator_login          = optional(string)
    administrator_login_password = optional(string)
    minimum_tls_version          = optional(string, "1.2")
    public_network_access_enabled = optional(bool, true)

    azuread_administrator = optional(list(object({
      login_username              = string
      object_id                   = string
      tenant_id                   = optional(string)
      azuread_authentication_only = optional(bool, false)
    })))

    identity = optional(object({
      type         = string
      identity_ids = optional(list(string))
    }))

    tags = optional(map(string))
  }))
}