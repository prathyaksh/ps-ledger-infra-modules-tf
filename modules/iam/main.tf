resource "google_service_account" "fin_ledger_vm_sa" {
  account_id   = var.sa_id
  display_name = "Custom SA for Finance App VM"
}

# Example: Give the VM permission to write logs to Cloud Logging
resource "google_project_iam_member" "fin_ledger_vm_roles" {
  project = var.project_id
  role    = "roles/logging.logWriter"
  member  = "serviceAccount:${google_service_account.fin_ledger_vm_sa.email}"
}