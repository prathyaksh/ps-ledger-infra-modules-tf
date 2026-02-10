output "key_id" {
    value = google_kms_crypto_key.db_key.id
    }

/*
output "db_password_secret_version_id" {
  value       = google_secret_manager_secret.db_password.id
  description = "The full ID of the secret container"
}
*/