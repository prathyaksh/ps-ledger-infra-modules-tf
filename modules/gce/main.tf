
resource "google_compute_instance" "vm_instance" {
  name         = var.instance_name
  machine_type = var.machine_type
  zone         = var.zone
  tags         = var.target_tags

  boot_disk {
    initialize_params {
      image  = var.os_image
      labels = var.labels
    }
  }

  network_interface {
    network    = var.network_self_link
    subnetwork = var.subnet_self_link
  }

  allow_stopping_for_update = true

  service_account {
    scopes = ["cloud-platform"]
    email  = var.email
  }
}