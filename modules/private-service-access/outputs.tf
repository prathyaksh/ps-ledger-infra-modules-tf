output "peering_range_name" {
  value       = google_compute_global_address.private_ip_alloc.name
  description = "The name of the peering address range created"
}

output "peering_network_id" {
  value       = google_service_networking_connection.private_vpc_connection.network
  description = "The network ID used for the service connection"
}