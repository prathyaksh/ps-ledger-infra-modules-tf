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