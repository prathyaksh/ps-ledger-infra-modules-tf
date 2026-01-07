output "internal_ip" {
  description = "The internal IP address of the instance"
  value       = google_compute_instance.finance_app_instance.network_interface[0].network_ip
}