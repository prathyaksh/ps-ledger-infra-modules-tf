output "lb_ip" {
  description = "The public IP address of the Global Load Balancer"
  value       = google_compute_global_forwarding_rule.ledger_global_fw_rule.ip_address
}