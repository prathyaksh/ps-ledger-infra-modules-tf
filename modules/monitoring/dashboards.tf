resource "google_monitoring_dashboard" "monitoring_dashboard" {
  # The display name in the console
  count          = var.dashboard_json != "" ? 1 : 0
  dashboard_json = var.dashboard_json
}