resource "azurerm_mssql_database" "example" {
  for_each = var.databases

  name      = each.value.name
  server_id = data.azurerm_mssql_server.serverid[each.key].id

  collation                                                  = each.value.collation
  license_type                                               = each.value.license_type
  max_size_gb                                                = each.value.max_size_gb
  sku_name                                                   = each.value.sku_name
  enclave_type                                               = each.value.enclave_type
  create_mode                                                = each.value.create_mode
  auto_pause_delay_in_minutes                                = each.value.auto_pause_delay_in_minutes
  creation_source_database_id                                = each.value.creation_source_database_id
  elastic_pool_id                                            = each.value.elastic_pool_id
  geo_backup_enabled                                         = each.value.geo_backup_enabled
  maintenance_configuration_name                             = each.value.maintenance_configuration_name
  ledger_enabled                                             = each.value.ledger_enabled
  min_capacity                                               = each.value.min_capacity
  restore_point_in_time                                      = each.value.restore_point_in_time
  recover_database_id                                        = each.value.recover_database_id
  recovery_point_id                                          = each.value.recovery_point_id
  restore_dropped_database_id                                = each.value.restore_dropped_database_id
  restore_long_term_retention_backup_id                      = each.value.restore_long_term_retention_backup_id
  read_replica_count                                         = each.value.read_replica_count
  read_scale                                                 = each.value.read_scale
  sample_name                                                = each.value.sample_name
  storage_account_type                                       = each.value.storage_account_type
  transparent_data_encryption_enabled                        = each.value.transparent_data_encryption_enabled
  transparent_data_encryption_key_vault_key_id               = each.value.transparent_data_encryption_key_vault_key_id
  transparent_data_encryption_key_automatic_rotation_enabled = each.value.transparent_data_encryption_key_automatic_rotation_enabled
  zone_redundant                                             = each.value.zone_redundant
  secondary_type                                             = each.value.secondary_type

  # --- Import block ---
  dynamic "import" {
    for_each = each.value.import != null ? [each.value.import] : []
    content {
      storage_uri                  = import.value.storage_uri
      storage_key                  = import.value.storage_key
      storage_key_type             = import.value.storage_key_type
      administrator_login          = import.value.administrator_login
      administrator_login_password = import.value.administrator_login_password
      authentication_type          = import.value.authentication_type
      storage_account_id           = import.value.storage_account_id
    }
  }

  # --- Threat detection ---
  dynamic "threat_detection_policy" {
    for_each = each.value.threat_detection_policy != null ? [each.value.threat_detection_policy] : []
    content {
      state                      = threat_detection_policy.value.state
      disabled_alerts            = threat_detection_policy.value.disabled_alerts
      email_account_admins       = threat_detection_policy.value.email_account_admins
      email_addresses            = threat_detection_policy.value.email_addresses
      retention_days             = threat_detection_policy.value.retention_days
      storage_account_access_key = threat_detection_policy.value.storage_account_access_key
      storage_endpoint           = threat_detection_policy.value.storage_endpoint
    }
  }

  # --- Long-term retention policy ---
  dynamic "long_term_retention_policy" {
    for_each = each.value.long_term_retention_policy != null ? [each.value.long_term_retention_policy] : []
    content {
      weekly_retention  = long_term_retention_policy.value.weekly_retention
      monthly_retention = long_term_retention_policy.value.monthly_retention
      yearly_retention  = long_term_retention_policy.value.yearly_retention
      week_of_year      = long_term_retention_policy.value.week_of_year
    }
  }

  # --- Short-term retention policy ---
  dynamic "short_term_retention_policy" {
    for_each = each.value.short_term_retention_policy != null ? [each.value.short_term_retention_policy] : []
    content {
      retention_days           = short_term_retention_policy.value.retention_days
      backup_interval_in_hours = short_term_retention_policy.value.backup_interval_in_hours
    }
  }

  # --- Identity block ---
  dynamic "identity" {
    for_each = each.value.identity != null ? [each.value.identity] : []
    content {
      type         = identity.value.type
      identity_ids = identity.value.identity_ids
    }
  }

  tags = each.value.tags
}
