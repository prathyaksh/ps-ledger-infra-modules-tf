resource "google_monitoring_alert_policy" "uptime_failure" {
  count        = var.lb_ip != "" ? 1 : 0
  display_name = "Alert: Ledger Site Down (Uptime Check)"
  combiner     = "OR"
  
  conditions {
    display_name = "Uptime Check Health"
    condition_threshold {
      # We filter for the specific uptime check we created
      filter     = "metric.type=\"monitoring.googleapis.com/uptime_check/check_passed\" resource.type=\"uptime_url\""
      duration   = "60s" 
      comparison = "COMPARISON_LT"
      threshold_value = 1
      
      trigger {
        count = 1
      }
    }
  }

  # We will add Notification Channels here in the next step!
  user_labels = {
    severity = "critical"
  }
}