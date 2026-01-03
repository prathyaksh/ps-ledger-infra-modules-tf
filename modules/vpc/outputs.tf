output "network_self_link" {
  value = google_compute_network.ledger_vpc_network.self_link
}

output "subnet_self_link" {
  value = google_compute_subnetwork.ledger_subnet.self_link
}