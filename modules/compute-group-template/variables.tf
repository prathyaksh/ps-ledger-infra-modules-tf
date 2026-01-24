variable "prefix" { 
  description = "Prefix for naming resources"
  type        = string
  
}
variable "machine_type" {
  description = "The machine type to create"
  type        = string
}
variable "region" {
  description = "The region to deploy resources in"
  type        = string
}
variable "network_id" {
  description = "The network ID where instances will be deployed"
  type        = string
}
variable "subnet_id" {
  description = "The subnet ID where instances will be deployed"
  type        = string
}
variable "startup_script" {
  description = "Startup script to initialize the instance"
  type        = string
}
variable "tags" {
  description = "Tags to associate with the instance template"
  type        = list(string)
  default     = []
}
variable "source_image" {
    description = "The source image for the boot disk"
    type        = string
  
}
variable "disk_type" {
    description = "The type of disk to use for the boot disk"
    type        = string
  
}

variable"project_id" {
  description = "The GCP project ID"
  type        = string
}

variable "service_account_email" {
  description = "The email of the service account to attach to the VM"
  type        = string
}