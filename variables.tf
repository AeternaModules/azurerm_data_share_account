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
  # --- Unconfirmed validation candidates, derived from azurerm_data_share_account's provider source ---
  # Not auto-enabled: either a bespoke provider validator we can't safely translate,
  # or a path that crosses a list-typed block (needs its own for_each wrapping).
  # Review, translate into a real validation{} block above, and delete once confirmed.
  # path: name
  #   source:    validate.AccountName: no recognizable `if ... { errors = append(...) }` pattern - read it by hand
  # path: resource_group_name
  #   condition: length(value) <= 90
  #   message:   [from resourcegroups.ValidateName: invalid when len(value) > 90]
  #   source:    [from resourcegroups.ValidateName: invalid when len(value) > 90]
  # path: resource_group_name
  #   condition: !endswith(value, ".")
  #   message:   [from resourcegroups.ValidateName: must not end with "."]
  #   source:    [from resourcegroups.ValidateName: must not end with "."]
  # path: resource_group_name
  #   condition: length(value) != 0
  #   message:   [from resourcegroups.ValidateName: invalid when len(value) == 0]
  #   source:    [from resourcegroups.ValidateName: invalid when len(value) == 0]
  # path: resource_group_name
  #   source:    [from resourcegroups.ValidateName] !matched
  # path: location
  #   source:    location.EnhancedValidate: no recognizable `if ... { errors = append(...) }` pattern - read it by hand
  # path: identity.type
  #   source:    validation.StringInSlice value list is not a literal []string - likely a generated PossibleValuesFor*() helper; resolve separately
  # path: tags
  #   source:    [from tags.ValidateHasLowerCaseKeys] !ok
  # path: tags
  #   condition: length(value) <= 50
  #   message:   [from tags.ValidateHasLowerCaseKeys: invalid when len(value) > 50]
  #   source:    [from tags.ValidateHasLowerCaseKeys: invalid when len(value) > 50]
  # path: tags
  #   condition: length(value) <= 512
  #   message:   [from tags.ValidateHasLowerCaseKeys: invalid when len(value) > 512]
  #   source:    [from tags.ValidateHasLowerCaseKeys: invalid when len(value) > 512]
  # path: tags
  #   source:    [from tags.ValidateHasLowerCaseKeys] strings.ToLower(key) != key
  # path: tags
  #   source:    [from tags.ValidateHasLowerCaseKeys] err != nil
  # path: tags
  #   condition: length(value) <= 256
  #   message:   [from tags.ValidateHasLowerCaseKeys: invalid when len(value) > 256]
  #   source:    [from tags.ValidateHasLowerCaseKeys: invalid when len(value) > 256]
}

