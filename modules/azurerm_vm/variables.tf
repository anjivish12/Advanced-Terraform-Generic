variable "vms" {
  type = map(object({
    # data block variable
    subnet_name         = string
    vnet_name           = string
    # pip_name            = string
    # kv_name = string
    # secret_name = string
    # secret_value = string

   # NIC resource details
    nic_name            = string
    location            = string
    resource_group_name = string
    ip_configuration = list(object({
      name                                          = string
      subnet_id                                     = optional(string)
      private_ip_address_allocation                 = string              
      public_ip_address_id                          = optional(string)

      private_ip_address                            = optional(string)
      private_ip_address_version                    = optional(string)
      gateway_load_balancer_frontend_ip_configuration_id = optional(string)
      primary                                       = optional(bool, false)
    }))

    # Optional NIC-level settings
    auxiliary_mode                 = optional(string)
    auxiliary_sku                  = optional(string)
    dns_servers                    = optional(list(string))
    edge_zone                      = optional(string)
    ip_forwarding_enabled          = optional(bool, false)
    accelerated_networking_enabled = optional(bool, false)
    internal_dns_name_label        = optional(string)

    vm_name        = string
    size           = string
    admin_username = string
    admin_password = string

    os_disk = list(object({
      caching                    = string
      storage_account_type         = optional(string)
      disk_size_gb                 = optional(number)
      name                         = optional(string)
      write_accelerator_enabled    = optional(bool)
      diff_disk_settings = optional(object({
        option    = string
        placement = optional(string)
      }))
      disk_encryption_set_id           = optional(string)
      secure_vm_disk_encryption_set_id = optional(string)
      security_encryption_type         = optional(string)
    }))

    source_image_reference = optional(list(object({
      publisher = string
      offer     = string
      sku       = string
      version   = string
    })))


    identity = optional(object({
      type        = string
      identity_ids = list(string)
    }))

    additional_capabilities = optional(object({
      ultra_ssd_enabled    = bool
      hibernation_enabled  = bool
    }))

    admin_ssh_key = optional(object({
      username   = string
      public_key = string
    }))

    boot_diagnostics = optional(object({
      storage_account_uri = string
    }))

    plan = optional(object({
      name      = string
      product   = string
      publisher = string
    }))

    os_image_notification = optional(object({
      timeout = string
    }))

    termination_notification = optional(object({
      enabled = bool
      timeout = optional(string)
    }))

    source_image_id                                       = optional(string)
    allow_extension_operations                             = optional(bool)
    availability_set_id                                    = optional(string)
    bypass_platform_safety_checks_on_user_schedule_enabled = optional(bool)
    capacity_reservation_group_id                           = optional(string)
    computer_name                                          = optional(string)
    custom_data                                            = optional(string)
    dedicated_host_id                                      = optional(string)
    dedicated_host_group_id                                 = optional(string)
    disk_controller_type                                   = optional(string)
    encryption_at_host_enabled                             = optional(bool)
    eviction_policy                                        = optional(string)
    extensions_time_budget                                 = optional(string)
    gallery_application                                    = optional(list(object({
            version_id = string
            automatic_upgrade_enabled = optional(string)
            configuration_blob_uri = optional(string)
            order = optional(number)
            tag = optional(map(string))
            treat_failure_as_deployment_failure_enabled = optional(bool)

    })))
    patch_assessment_mode                                  = optional(string)
    patch_mode                                             = optional(string)
    max_bid_price                                          = optional(number)
    platform_fault_domain                                  = optional(number)
    priority                                               = optional(string)
    provision_vm_agent                                     = optional(bool)
    proximity_placement_group_id                            = optional(string)
    reboot_setting = optional(string)
    secure_boot_enabled                                     = optional(bool)
    user_data                                              = optional(string)
    vtpm_enabled                                           = optional(bool)
    virtual_machine_scale_set_id                            = optional(string)
    zone                                                   = optional(string)
  }))
}
