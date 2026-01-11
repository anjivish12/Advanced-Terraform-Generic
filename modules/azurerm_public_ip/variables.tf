variable "pips" {
  type = map(object({
    name                = string
    location            = string
    resource_group_name = string
    allocation_method   = string
    # Optional
    zones                   = optional(list(string))
    ddos_protection_mode    = optional(string) # Disabled, Enabled, VirtualNetworkInherited
    ddos_protection_plan_id = optional(string)
    domain_name_label       = optional(string)
    domain_name_label_scope = optional(string) # NoReuse, ResourceGroupReuse, SubscriptionReuse, TenantReuse
    edge_zone               = optional(string)
    idle_timeout_in_minutes = optional(number)
    ip_tags                 = optional(map(string))
    ip_version              = optional(string) # IPv4 or IPv6
    public_ip_prefix_id     = optional(string)
    reverse_fqdn            = optional(string)
    sku                     = optional(string) # Basic or Standard
    sku_tier                = optional(string) # Regional or Global
    tags                    = optional(map(string))
  }))

}