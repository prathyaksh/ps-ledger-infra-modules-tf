resource "google_secret_manager_secret" "db_password" {
  secret_id = "${var.name}-db-password"
  
  replication {
    user_managed {
      replicas {
        location = var.region
        customer_managed_encryption {
          kms_key_name = var.kms_key_id
        }
      }
    }
  }
}
