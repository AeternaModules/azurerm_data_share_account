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
}

