variable "environment" {
  description = "Deployment environment (e.g., dev, staging, prod)"
  type        = string
}
variable "region" {
  description = "The region where the Cloud SQL instance will be created"
  type        = string
}
variable "database_version" {
  description = "The database version for the Cloud SQL instance"
  type        = string
}
variable "tier" {
  description = "The machine type (tier) for the Cloud SQL instance"
  type        = string
}
variable "project_id" {
  description = "The GCP project ID where the Cloud SQL instance will be created"
  type        = string
}
variable "instance_name" {
  description = "The name of the Cloud SQL instance"
  type        = string
}
variable "authorized_networks" {
  description = "List of authorized networks for the Cloud SQL instance"
  type        = list(object({
    name = string
    value = string
  }))
  default     = []
}
variable "database_flags" {
  description = "Database flags to set on the Cloud SQL instance"
  type        = map(string)
  default     = {}
}
variable "backup_start_time" {
  description = "Start time for daily backups (HH:MM format, UTC)"
  type        = string
  default     = "02:00"
}
variable "db_name" {
  description = "The name of the specific database to create inside the instance"
  type        = string
}
variable "db_user_name" {
  description = "The name of the database user to create"
  type        = string
}
variable "db_password" {
  description = "The password for the database user"
  type        = string
  sensitive   = true
  default     = null
}
variable "vpc_id" {
  description = "The ID or Self Link of the VPC network for private IP"
  type        = string
}
variable "availability_type" {
  description = "The availability type for the instance (ZONAL or REGIONAL)"
  type        = string
  default     = "ZONAL"
}
variable "backup_enabled" {
  description = "Whether backups are enabled"
  type        = bool
  default     = true
}
variable "pitr_enabled" {
  description = "Whether Point-in-Time Recovery is enabled"
  type        = bool
  default     = false
}
variable "disk_autoresize" {
  description = "Whether disk autoresize is enabled"
  type        = bool
  default     = true
}
variable "disk_autoresize_limit" {
  description = "The maximum size to which the disk can be auto-resized (in GB)"
  type        = number
  default     = 0 # 0 means no limit
}
variable "disk_type" {
  description = "The type of disk to use for the instance (e.g., PD_SSD, PD_HDD)"
  type        = string
  default     = "PD_SSD"
}

variable "name" {
  description = "The name prefix for the Cloud SQL instance"
  type        = string
}