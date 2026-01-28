variable "db_key_name" {
  description = "The name of the KMS Crypto Key for database encryption"
  type        = string
  
}

variable "name" {
  description = "The name prefix for the KMS resources"
  type        = string
}
variable "region" {
  description = "The region where the KMS resources will be created"
  type        = string
}
