# Resource A: Creates a Service Account (Independent)
resource "google_service_account" "sa_creation" {
  count        = var.create_sa ? 1 : 0
  account_id   = var.sa_id
  display_name = var.display_name
  project      = var.project_id
  lifecycle {
    create_before_destroy = false
  }
}

# Resource B: Assigns roles to ANY member (Independent)
resource "google_project_iam_member" "role_assignment" {
  for_each = toset(var.roles_list)
  project  = var.project_id
  role     = each.key
  member   = var.member_id
}

# Creates Service agents

resource "google_project_service_identity" "service_identity" {
  provider = google-beta
  project  = var.project_id
  service  = var.service_name
}

# Generic KMS binding for that identity
resource "google_kms_crypto_key_iam_member" "kms_access" {
  crypto_key_id = var.kms_key_id
  role          = var.role
  member        = "serviceAccount:${google_project_service_identity.service_identity.email}"
}

