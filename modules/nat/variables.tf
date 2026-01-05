variable "network_name" {
  description = "The name of the VPC network"
  type        = string
}

variable "region" {
  description = "The region where the subnet will be created"
  type        = string
}

variable "network_id" {
  description = "Network ID for NAT"
  type        = string
}