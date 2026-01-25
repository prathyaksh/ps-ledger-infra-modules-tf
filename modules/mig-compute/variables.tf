variable "name" {
  description = "The name prefix for the MIG"
  type        = string
  
}
variable "region" {
  description = "The region where the MIG will be created"
  type        = string
}
variable "project_id" {
  description = "The GCP project ID"
  type        = string
}
variable "instance_template_id" {
  description = "The ID of the instance template to use for the MIG"
  type        = string
}
variable "target_size" {
  description = "The target number of instances in the MIG"
  type        = number
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
variable "health_check_id" {
  description = "The ID of the health check to use for auto-healing"
  type        = string
}

