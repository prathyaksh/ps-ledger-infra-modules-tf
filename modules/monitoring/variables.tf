variable "dashboard_json" {
  description = "The JSON content of the Monitoring Dashboard"
  type        = string
}

variable "project_id" {
  description = "The GCP Project ID where monitoring resources will be created"
  type        = string
}

variable "lb_ip" {
  description = "The IP address of the load balancer to be monitored by the uptime check"
  type        = string
}

variable "dashboard_name" {
  description = "The Name of the Monitoring Dashboard"
  type        = string
}

variable "alert_email_address" {
  description = "The email address to send alert notifications to"
  type        = string
}

# --- NEW CONFIGURATION MAPS ---

variable "threshold_alerts" {
  description = "Map of threshold-based alert configurations"
  type = map(object({
    display_name   = string
    filter         = string
    duration       = string
    comparison     = string
    threshold      = number
    severity       = string
  }))
  default = {}
}

variable "absence_alerts" {
  description = "Map of absence-based alert configurations"
  type = map(object({
    display_name = string
    filter       = string
    duration     = string
  }))
  default = {}
}