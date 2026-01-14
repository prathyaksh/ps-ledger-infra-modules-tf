resource "google_monitoring_uptime_check_config" "uptime_https" {
  count        = var.lb_ip != "" ? 1 : 0
  display_name = "${var.dashboard_name}-uptime-check"
  timeout      = "10s"
  period       = "60s"

  http_check {
    path = "/"
    port = "80"
  }

  monitored_resource {
    type = "uptime_url"
    labels = {
      project_id = var.project_id
      host       = var.lb_ip
    }
  }
}