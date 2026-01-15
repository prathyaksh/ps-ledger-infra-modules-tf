resource "google_monitoring_notification_channel" "email" {
  # We only create this if an email is provided in the variables
  count        = var.alert_email_address != "" ? 1 : 0
  display_name = "SRE Team Email"
  type         = "email"
  
  labels = {
    email_address = var.alert_email_address
  }
}