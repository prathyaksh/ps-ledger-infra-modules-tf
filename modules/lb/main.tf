# 1. Health Check: Pings the VM to see if Nginx is alive
resource "google_compute_health_check" "default_health_check" {
  name = "${var.name}-hc"
  http_health_check {
    port = var.health_check_port
  }
}

# 2. Backend Service: Groups your VMs and connects the Health Check
resource "google_compute_backend_service" "ledger_backend_service" {
  name          = "${var.name}-backend"
  protocol      = var.protocol
  port_name     = var.backend_port_name # Matches the name in UIG
  health_checks = [google_compute_health_check.default_health_check.id]

  dynamic "backend" {
    for_each = var.backend_groups
    content {
      group = backend.value
    }
  }
}

# 3. URL Map: The "Router" that directs traffic to the Backend Service
resource "google_compute_url_map" "ledger_url_map" {
  name            = "${var.name}-url-map"
  default_service = google_compute_backend_service.ledger_backend_service.id
}

# 4. Target Proxy: Decides how to handle the HTTP request
resource "google_compute_target_http_proxy" "ledger_target_http_proxy" {
  name    = "${var.name}-proxy"
  url_map = google_compute_url_map.ledger_url_map.id
}

# 5. Forwarding Rule: THE FRONT DOOR. This creates your Public IP.
resource "google_compute_global_forwarding_rule" "ledger_global_fw_rule" {
  name       = "${var.name}-forwarding-rule"
  target     = google_compute_target_http_proxy.ledger_target_http_proxy.id
  port_range = var.lb_port # No longer hardcoded!
}