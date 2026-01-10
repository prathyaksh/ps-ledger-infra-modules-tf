variable "instance_name" {
  description = "The name of the Instance"
  type        = string
}

variable "zone" {
  description = "The zone where the instance will be created"
  type        = string
}

variable "machine_type" {
  description = "The primary IP range for the subnet"
  type        = string
}

variable "target_tags" {
  description = "The target tags for the instance"
  type        = list(string)
}

variable "network_self_link" {
  description = "The self link of the VPC network"
  type        = string
}

variable "subnet_self_link" {
  description = "The self link of the subnet"
  type        = string
}

variable "email"  {
  description = "Email of the service account"
  type        = string
}

variable "os_image" {
  description = "The OS image for the boot disk"
  type        = string
}
variable "labels" {
  description = "Labels to apply to the instance"
  type        = map(string)
  default     = {}
}

variable "startup_script" {
  type    = string
  default = ""
}