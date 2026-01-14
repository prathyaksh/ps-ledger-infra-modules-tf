output "dashboard_id" {
  value = google_monitoring_dashboard.monitoring_dashboard.id
}

output "uptime_check_id" {
  value = google_monitoring_uptime_check_config.uptime_https.uptime_check_id
}