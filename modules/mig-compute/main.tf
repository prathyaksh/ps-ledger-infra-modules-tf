resource "google_compute_region_instance_group_manager" "mig_compute_group" {
  name               = "${var.name}-mig"
  base_instance_name = var.name
  region             = var.region
  project            = var.project_id

  # This is where we link the Blueprint!
  version {
    instance_template = var.instance_template_id
  }

  target_size = var.target_size

  # Named ports allow the Load Balancer to find Nginx
  dynamic "named_port" {
    for_each = var.named_ports
    content {
      name = named_port.value.name
      port = named_port.value.port
    }
  }

  # This is Task 3: The "Self-Healer" (Auto-healing)
  auto_healing_policies {
    health_check      = var.health_check_id
    initial_delay_sec = 300 # Wait 5 mins for Nginx to start before checking
  }
}