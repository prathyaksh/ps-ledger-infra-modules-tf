resource "google_compute_firewall" "allow_iap_ssh" {
  name    = "${var.network_name}-allow-iap-ssh"
  network = var.network_name

  allow {
    protocol = "tcp"
    ports    = ["22"]
  }
  target_tags = ["ssh-access"]

  # This is the magic IP range. It is Google's internal IAP proxy.
  source_ranges = ["35.235.240.0/20"]
}