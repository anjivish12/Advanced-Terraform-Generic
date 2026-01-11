variable "secrets" {

  type = map(object({
    # Required
    kv_name     = string
    rg_name     = string
    secret_name = string

    # Optional values (exactly one must be defined)
    secret_value            = optional(string)
    secret_value_wo         = optional(string)
    secret_value_wo_version = optional(number)

    # Optional metadata
    content_type    = optional(string)
    not_before_date = optional(string)
    expiration_date = optional(string)
    tags            = optional(map(string))
  }))
}
