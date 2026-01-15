resource "google_monitoring_alert_policy" "uptime_check_failure" {
  count        = lookup(var.threshold_alerts, "uptime", null) != null ? 1 : 0
  display_name = var.threshold_alerts["uptime"].display_name
  combiner     = "OR"
  
  conditions {
    display_name = "Uptime Check Health"
    condition_threshold {
      filter     = var.threshold_alerts["uptime"].filter
      duration   = var.threshold_alerts["uptime"].duration
      comparison = var.threshold_alerts["uptime"].comparison
      threshold_value = var.threshold_alerts["uptime"].threshold
      
      trigger {
        count = 1
      }
    }
  }

  notification_channels = [google_monitoring_notification_channel.email[0].name]
  user_labels = {
    severity = var.threshold_alerts["uptime"].severity
  }
}

resource "google_monitoring_alert_policy" "threshold_alert" {
  count        = lookup(var.threshold_alerts, "cpu", null) != null ? 1 : 0
  display_name = var.threshold_alerts["cpu"].display_name
  combiner     = "OR"

  conditions {
    display_name = "CPU usage is high"
    condition_threshold {
      filter     = var.threshold_alerts["cpu"].filter
      duration   = var.threshold_alerts["cpu"].duration
      comparison = var.threshold_alerts["cpu"].comparison
      threshold_value = var.threshold_alerts["cpu"].threshold
      
      trigger {
        count = 1
      }
    }
  }

  notification_channels = [google_monitoring_notification_channel.email[0].name]
  user_labels = {
    severity = var.threshold_alerts["cpu"].severity
  }
}

resource "google_monitoring_alert_policy" "absence_alert" {
  count        = lookup(var.absence_alerts, "traffic", null) != null ? 1 : 0
  display_name = var.absence_alerts["traffic"].display_name
  combiner     = "OR"

  conditions {
    display_name = "LB Traffic Absence"
    condition_absent {
      filter   = var.absence_alerts["traffic"].filter
      duration = var.absence_alerts["traffic"].duration

      aggregations {
        alignment_period     = "60s"
        per_series_aligner   = "ALIGN_RATE"
      }
    }
  }

  notification_channels = [google_monitoring_notification_channel.email[0].name]
}