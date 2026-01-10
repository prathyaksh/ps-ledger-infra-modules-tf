variable "group_name" {
  type = string
}

variable "zone" {
  type = string
}

variable "instances" {
  description = "List of self_links of the VMs to include in this group"
  type        = list(string)
}

variable "named_ports" {
  description = "List of named ports"
  type = list(object({
    name = string
    port = number
  }))
  # Default to HTTP if nothing is provided
  default = [
    {
      name = "http"
      port = 80
    }
  ]
}