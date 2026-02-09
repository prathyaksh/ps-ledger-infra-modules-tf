variable "project_id" {
  type        = string
  description = "The ID of the Google Cloud project"
}

variable "roles_list" {
  type        = list(string)
  default     = []
  description = "List of IAM roles to assign"
}

variable "member_id" {
  type        = string
  default     = ""
  description = "The member ID (e.g., user:email@domain.com, serviceAccount:sa@project.iam.gserviceaccount.com)"
}

variable "sa_id" {
  type        = string
  default     = null
  description = "Service account ID or email"
}

variable "display_name" {
  type        = string
  default     = ""
  description = "Display name for the service account"
}

variable "create_sa" {
  type        = bool
  default     = false
  description = "Whether to create a new service account"
}

variable "service_name" {
  type        = string
  description = "The service for which to create the service identity (e.g., sqladmin.googleapis.com)"
  default = null
}

variable "kms_key_id" {
  type        = string
  description = "The ID of the KMS Crypto Key for encryption"
  default = null
}
variable "role" {
  type        = string
  description = "The IAM role to assign to the service identity for KMS access"
  default = ""
}