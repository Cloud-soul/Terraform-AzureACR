variable "name" {
  description = "The name of the container registry."
  type        = string
  default     = "devcrppluseus"
}

variable "resource_group_name" {
  description = "The name of the resource group."
  type        = string
  default     = "dev-resource-group"
}

variable "location" {
  description = "The location/region in which to create the registry."
  type        = string
  default     = "East US"
}

variable "sku_name" {
  description = "The SKU name of the container registry."
  type        = string
  default     = "Standard"
}

variable "admin_user_enabled" {
  description = "Specifies whether the admin user is enabled."
  type        = bool
  default     = true
}

variable "tags" {
  description = "A mapping of tags to assign to the resource."
  type        = map(string)
  default     = {}
}

variable "georeplication_locations" {
  description = <<-EOT
    A list of Azure locations where the Container Registry should be geo-replicated. Only activated on Premium SKU.
    Supported properties are:
      - location: string
      - zone_redundancy_enabled: bool
      - regional_endpoint_enabled: bool
      - tags: map(string)
    Alternatively, this can be a list of strings (each element is a location).
  EOT
  type    = any
  default = []
}

variable "images_retention_enabled" {
  description = "Specifies whether images retention is enabled (Premium only)."
  type        = bool
  default     = false
}

variable "images_retention_days" {
  description = "Specifies the number of images retention days."
  type        = number
  default     = 7
}

variable "trust_policy_enabled" {
  description = "Specifies whether the trust policy is enabled (Premium only)."
  type        = bool
  default     = false
}
