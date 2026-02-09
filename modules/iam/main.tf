# Resource A: Creates a Service Account (Independent)
resource "google_service_account" "sa_creation" {
  count        = var.create_sa ? 1 : 0
  account_id   = var.sa_id
  display_name = var.display_name
  project      = var.project_id
}

# Resource B: Assigns roles to ANY member (Independent)
resource "google_project_iam_member" "role_assignment" {
  for_each = toset(var.roles_list)
  project  = var.project_id
  role     = each.key
  member   = var.member_id
}

# Resource C: Creates Service agents (NOW PROTECTED)
resource "google_project_service_identity" "service_identity" {
  # ONLY run if a service name is actually provided
  count    = var.service_name != null ? 1 : 0 
  
  provider = google-beta
  project  = var.project_id
  service  = var.service_name
}

# Resource D: Generic KMS binding (NOW PROTECTED)
resource "google_kms_crypto_key_iam_member" "kms_access" {
  # ONLY run if a KMS Key ID is actually provided
  count         = var.kms_key_id != null ? 1 : 0 
  
  crypto_key_id = var.kms_key_id
  role          = var.role
  
  # Logic: Use the identity above if it exists, otherwise use the member_id variable
  member        = var.service_name != null ? "serviceAccount:${google_project_service_identity.service_identity[0].email}" : var.member_id
}