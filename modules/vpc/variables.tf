variable "network_name" {
  description = "The name of the VPC network"
  type        = string
}

variable "region" {
  description = "The region where the subnet will be created"
  type        = string
}

variable "cidr_range" {
  description = "The primary IP range for the subnet"
  type        = string
}