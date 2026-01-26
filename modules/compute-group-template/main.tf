resource "google_compute_instance_template" "gce_vm_template" {
  name_prefix  = "${var.prefix}-template-"
  machine_type = var.machine_type
  region       = var.region

  # This is the "Instruction" for the disk
  disk {
    source_image = var.source_image
    auto_delete  = true
    boot         = true
    disk_type    = var.disk_type
  }
  service_account {
    email  = var.service_account_email
    scopes = ["cloud-platform"] # Required for Ops Agent to talk to Google APIs
  }

  # This is the "Instruction" for the network
  network_interface {
    network    = var.network_id
    subnetwork = var.subnet_id
    # this assigns an external IP everytime an instanc eis created by MIG
    #access_config {} 
  }

  # This is the "Instruction" for the software (Nginx)
  metadata_startup_script = var.startup_script

  # Tags allow your Firewall/LB to find the new VMs
  tags = var.tags

  lifecycle {
    create_before_destroy = true
  }
  
}