variable "name" { type = string }

variable "backend_groups" {
  description = "List of instance group self_links"
  type        = list(string)
}

variable "lb_port" {
  description = "The port the Load Balancer listens on (External)"
  type        = string
  default     = "80"
}

variable "backend_port_name" {
  description = "The name of the port defined in the UIG"
  type        = string
  default     = "http"
}

variable "protocol" {
  type    = string
  default = "HTTP"
}
variable "health_check_port" {
  description = "The port the Health Check uses to ping the backend instances"
  type        = number
  default     = 80
}
