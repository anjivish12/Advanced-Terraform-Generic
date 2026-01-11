


# resource "azurerm_linux_virtual_machine_scale_set" "vmss" {
#   for_each = var.vmss
#   name                = each.value.name
#   resource_group_name = each.value.resource_group_name
#   location            = each.value.location
#   sku                 = each.value.sku
#   instances           = each.value.instances
#   admin_username      = each.value.admin_username

#   admin_password = each.value.admin_password
#   disable_password_authentication = false
#   dynamic "source_image_reference" {
#     for_each = each.value.source_image_reference
#     content {
#         publisher = source_image_reference.value.publisher
#         offer     = source_image_reference.value.offer
#         sku       = source_image_reference.value.sku
#         version   = source_image_reference.value.version
#     }
    
#   }

#   dynamic "os_disk" {
#     for_each = each.value.os_disk
#     content {
#         storage_account_type = os_disk.value.storage_account_type
#         caching              = os_disk.value.caching
      
#     }
  
#   }

#  dynamic "network_interface" {
#     for_each = each.value.network_interface
#     content {
#       name = network_interface.value.name
#       primary = true
    
  
#     dynamic "ip_configuration" {
#         for_each = network_interface.value.ip_configuration
#         content {
#             name      = ip_configuration.value.name
#             primary   = true
#             subnet_id = data.azurerm_subnet.subnet_id[each.key].id

#         }
 
#     }
#   }
# }
# }