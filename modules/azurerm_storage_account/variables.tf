variable "stgs" {
  type = map(object({
    name                     = string
    resource_group_name      = string
    location                 = string
    account_kind             = optional(string)
    account_tier             = string
    account_replication_type = string
    provisioned_billing_model_version = optional(string)
    cross_tenant_replication_enabled  = optional(bool)
    access_tier               = optional(string)
    edge_zone                 = optional(string)
    https_traffic_only_enabled = optional(bool)
    min_tls_version           = optional(string)
    allow_nested_items_to_be_public = optional(bool)
    shared_access_key_enabled = optional(bool)
    public_network_access_enabled = optional(bool)
    default_to_oauth_authentication = optional(bool)
    is_hns_enabled            = optional(bool)
    nfsv3_enabled             = optional(bool)
    large_file_share_enabled  = optional(bool)
    local_user_enabled        = optional(bool)
    infrastructure_encryption_enabled = optional(bool)
    sftp_enabled              = optional(bool)
    dns_endpoint_type         = optional(string)
    queue_encryption_key_type = optional(string)
    table_encryption_key_type = optional(string)
    allowed_copy_scope        = optional(string)
    tags = optional(map(string))

    identity = optional(list(object({
      type         = string
      identity_ids = optional(list(string))
    })))

    custom_domain = optional(list(object({
      name          = string
      use_subdomain = optional(bool)
    })))

    customer_managed_key = optional(list(object({
      key_vault_key_id        = optional(string)
      managed_hsm_key_id      = optional(string)
      user_assigned_identity_id = string
    })))

    network_rules = optional(list(object({
      default_action            = string
      bypass                    = optional(list(string))
      ip_rules                  = optional(list(string))
      virtual_network_subnet_ids = optional(list(string))
      private_link_access = optional(list(object({
        endpoint_resource_id = string
        endpoint_tenant_id   = optional(string)
      })))
    })))

    blob_properties = optional(list(object({
      versioning_enabled            = optional(bool)
      change_feed_enabled           = optional(bool)
      change_feed_retention_in_days = optional(number)
      default_service_version       = optional(string)
      last_access_time_enabled      = optional(bool)
      delete_retention_policy = optional(list(object({
        days                    = optional(number)
        permanent_delete_enabled = optional(bool)
      })))
      restore_policy = optional(list(object({
        days = number
      })))
      container_delete_retention_policy = optional(list(object({
        days = optional(number)
      })))
      cors_rule = optional(list(object({
        allowed_headers    = list(string)
        allowed_methods    = list(string)
        allowed_origins    = list(string)
        exposed_headers    = list(string)
        max_age_in_seconds = number
      })))
    })))

    static_website = optional(list(object({
      index_document     = optional(string)
      error_404_document = optional(string)
    })))
  }))
}
