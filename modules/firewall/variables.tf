variable "firewall_rules" {
  description = "Map of firewall rules"
  type = map(object({
    action        = string          # Added this
    protocol      = string
    ports         = list(string)
    source_ranges = list(string)
    target_tags   = list(string)
  }))
}

variable "network_name" {
  description = "The name of the network to which the firewall rules will be applied"
  type        = string
}