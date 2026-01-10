variable "network_name" {
  description = "The name of the VPC network"
  type        = string
}
variable "firewall_rules" {
  description = "A map of custom firewall rules to create"
  type = map(object({
    allow = list(object({
      protocol = string
      ports    = list(string)
    }))
    source_ranges = list(string)
    target_tags   = list(string)
  }))
  default = {}
}