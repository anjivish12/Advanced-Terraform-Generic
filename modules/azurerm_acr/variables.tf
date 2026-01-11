variable "acrs" {
  type = map(object({
    name                          = string
    resource_group_name           = string
    location                      = string
    sku                           = string
    admin_enabled                 = optional(bool)
    public_network_access_enabled = optional(bool)
    quarantine_policy_enabled     = optional(bool)
    retention_policy_in_days      = optional(number)
    trust_policy_enabled          = optional(bool)
    zone_redundancy_enabled       = optional(bool)
    export_policy_enabled         = optional(bool)
    anonymous_pull_enabled        = optional(bool)
    data_endpoint_enabled         = optional(bool)
    network_rule_bypass_option    = optional(string)
    tags                          = optional(map(string))

    identity = optional(list(object({
      type         = string
      identity_ids = optional(list(string))
    })))

    encryption = optional(list(object({
      key_vault_key_id   = string
      identity_client_id = string
    })))

    network_rule_set = optional(list(object({
      default_action = optional(string)
      ip_rule = optional(list(object({
        action   = string
        ip_range = string
      })))
    })))

    georeplications = optional(list(object({
      location                  = string
      regional_endpoint_enabled = optional(bool)
      zone_redundancy_enabled   = optional(bool)
      tags                      = optional(map(string))
    })))
  }))
}
