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