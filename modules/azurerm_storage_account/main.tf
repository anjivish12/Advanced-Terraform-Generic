resource "azurerm_storage_account" "stg" {
  for_each = var.stgs

  name                     = each.value.name
  resource_group_name      = each.value.resource_group_name
  location                 = each.value.location
  account_kind             = each.value.account_kind
  account_tier             = each.value.account_tier
  account_replication_type = each.value.account_replication_type
  provisioned_billing_model_version = each.value.provisioned_billing_model_version
  cross_tenant_replication_enabled  = each.value.cross_tenant_replication_enabled
  access_tier               = each.value.access_tier
  edge_zone                 = each.value.edge_zone
  https_traffic_only_enabled = each.value.https_traffic_only_enabled
  min_tls_version           = each.value.min_tls_version
  allow_nested_items_to_be_public = each.value.allow_nested_items_to_be_public
  shared_access_key_enabled = each.value.shared_access_key_enabled
  public_network_access_enabled = each.value.public_network_access_enabled
  default_to_oauth_authentication = each.value.default_to_oauth_authentication
  is_hns_enabled            = each.value.is_hns_enabled
  nfsv3_enabled             = each.value.nfsv3_enabled
  large_file_share_enabled  = each.value.large_file_share_enabled
  local_user_enabled        = each.value.local_user_enabled
  infrastructure_encryption_enabled = each.value.infrastructure_encryption_enabled
  sftp_enabled              = each.value.sftp_enabled
  dns_endpoint_type         = each.value.dns_endpoint_type
  queue_encryption_key_type = each.value.queue_encryption_key_type
  table_encryption_key_type = each.value.table_encryption_key_type
  allowed_copy_scope        = each.value.allowed_copy_scope

  tags = each.value.tags

  # ---------- Identity ----------
  dynamic "identity" {
    for_each = each.value.identity  == null ? [] : each.value.identity
    content {
      type         = identity.value.type
      identity_ids = identity.value.identity_ids
    }
  }

  # ---------- Custom Domain ----------
  dynamic "custom_domain" {
    for_each = each.value.custom_domain  == null ? [] : each.value.custom_domain
    content {
      name          = custom_domain.value.name
      use_subdomain = custom_domain.value.use_subdomain
    }
  }

  # ---------- Customer Managed Key ----------
  dynamic "customer_managed_key" {
    for_each = each.value.customer_managed_key  == null ? [] : each.value.customer_managed_key
    content {
      key_vault_key_id        = customer_managed_key.value.key_vault_key_id
      managed_hsm_key_id      = customer_managed_key.value.managed_hsm_key_id
      user_assigned_identity_id = customer_managed_key.value.user_assigned_identity_id
    }
  }

  # ---------- Network Rules ----------
  dynamic "network_rules" {
    for_each = each.value.network_rules  == null ? [] : each.value.network_rules
    content {
      default_action             = network_rules.value.default_action
      bypass                     = network_rules.value.bypass
      ip_rules                   = network_rules.value.ip_rules
      virtual_network_subnet_ids  = network_rules.value.virtual_network_subnet_ids

      dynamic "private_link_access" {
        for_each = network_rules.value.private_link_access  == null ? [] : network_rules.value.private_link_access
        content {
          endpoint_resource_id = private_link_access.value.endpoint_resource_id
          endpoint_tenant_id   = private_link_access.value.endpoint_tenant_id
        }
      }
    }
  }

  # ---------- Blob Properties ----------
  dynamic "blob_properties" {
    for_each = each.value.blob_properties  == null ? [] : each.value.blob_properties
    content {
      versioning_enabled               = blob_properties.value.versioning_enabled
      change_feed_enabled              = blob_properties.value.change_feed_enabled
      change_feed_retention_in_days    = blob_properties.value.change_feed_retention_in_days
      default_service_version          = blob_properties.value.default_service_version
      last_access_time_enabled         = blob_properties.value.last_access_time_enabled

      dynamic "delete_retention_policy" {
        for_each = blob_properties.value.delete_retention_policy  == null ? [] : blob_properties.value.delete_retention_policy 
        content {
          days                    = delete_retention_policy.value.days
          permanent_delete_enabled = delete_retention_policy.value.permanent_delete_enabled
        }
      }

      dynamic "restore_policy" {
        for_each = blob_properties.value.restore_policy  == null ? [] : blob_properties.value.restore_policy
        content {
          days = restore_policy.value.days
        }
      }

      dynamic "container_delete_retention_policy" {
        for_each = blob_properties.value.container_delete_retention_policy  == null ? [] : blob_properties.value.container_delete_retention_policy
        content {
          days = container_delete_retention_policy.value.days
        }
      }

      dynamic "cors_rule" {
        for_each = blob_properties.value.cors_rule  == null ? [] : blob_properties.value.cors_rule
        content {
          allowed_headers    = cors_rule.value.allowed_headers
          allowed_methods    = cors_rule.value.allowed_methods
          allowed_origins    = cors_rule.value.allowed_origins
          exposed_headers    = cors_rule.value.exposed_headers
          max_age_in_seconds = cors_rule.value.max_age_in_seconds
        }
      }
    }
  }

  # ---------- Static Website ----------
  dynamic "static_website" {
    for_each = each.value.static_website == null ? [] : each.value.static_website
    content {
      index_document     = static_website.value.index_document
      error_404_document = static_website.value.error_404_document
    }
  }
}
