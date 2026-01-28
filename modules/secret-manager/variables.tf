variable "name" {
    description = "The name prefix for the KMS resources"
    type        = string
    }
variable "region" {
    description = "The region where the KMS resources will be created"
    type        = string
    }

variable "kms_key_id"{
    description = "The ID of the KMS Crypto Key for encryption"
    type        = string
}