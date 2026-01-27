variable "project_id" {
  type        = string
  description = "The GCP Project ID"
}

variable "vpc_id" {
  type        = string
  description = "The ID or Self Link of the VPC network"
}

variable "peering_range_name" {
  type        = string
  description = "The name for the reserved IP range (e.g., 'google-reserved-range')"
}

variable "prefix_length" {
  type        = number
  default     = 16 # Default /16 provides 65,536 IPs—plenty for a large fleet
  description = "The prefix length of the IP range"
}

variable "description" {
  type        = string
  default     = "Private Service Access for Google Cloud Services"
  description = "Optional description for the IP allocation"
}