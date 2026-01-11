# variable "vmss" {
#     type = map(object({
#       subnet_name = string
#       virtual_network_name = string
#       resource_group_name = string 
#       name = string
#       location = string
#       sku = string
#       instances = number
#       admin_username = string
#       admin_password = string
#       source_image_reference = list(object({
#         publisher = string
#         offer = string
#         version = string 
#         sku = string
#       }))
#       os_disk = list(object({
#         storage_account_type = string
#         caching = string 
#       }))
#       network_interface = list(object({
#         name = string
#         ip_configuration = list(object({
#           name = string
#         }))
#       }))

#     }))
  
# }
