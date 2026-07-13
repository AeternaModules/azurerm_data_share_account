variable "data_share_accounts" {
  description = <<EOT
Map of data_share_accounts, attributes below
Required:
    - location
    - name
    - resource_group_name
    - identity (block):
        - type (required)
Optional:
    - tags
EOT

  type = map(object({
    location            = string
    name                = string
    resource_group_name = string
    tags                = optional(map(string))
    identity = object({
      type = string
    })
  }))
  validation {
    condition = alltrue([
      for k, v in var.data_share_accounts : (
        length(v.resource_group_name) <= 90
      )
    ])
    error_message = "[from resourcegroups.ValidateName: invalid when len(value) > 90]"
  }
  validation {
    condition = alltrue([
      for k, v in var.data_share_accounts : (
        !endswith(v.resource_group_name, ".")
      )
    ])
    error_message = "[from resourcegroups.ValidateName: must not end with \".\"]"
  }
  validation {
    condition = alltrue([
      for k, v in var.data_share_accounts : (
        length(v.resource_group_name) != 0
      )
    ])
    error_message = "[from resourcegroups.ValidateName: invalid when len(value) == 0]"
  }
  validation {
    condition = alltrue([
      for k, v in var.data_share_accounts : (
        v.tags == null || (length(v.tags) <= 50)
      )
    ])
    error_message = "[from tags.ValidateHasLowerCaseKeys: invalid when len(value) > 50]"
  }
  # Note: 9 additional provider-side validators are enforced at apply time but not mirrored as validation{} blocks here (bespoke or non-mechanically-translatable).
}

