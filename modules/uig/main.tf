resource "google_compute_instance_group" "unmanaged_group" {
  name        = var.group_name
  description = "UIG for ${var.group_name}"
  zone        = var.zone
  instances   = var.instances

  # We use a dynamic block to allow any number of ports
  dynamic "named_port" {
    for_each = var.named_ports
    content {
      name = named_port.value.name
      port = named_port.value.port
    }
  }
}