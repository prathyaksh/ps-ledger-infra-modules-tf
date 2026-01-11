resource "google_monitoring_dashboard" "monitoring_dashboard" {
  # The display name in the console
  dashboard_json = var.dashboard_json
}