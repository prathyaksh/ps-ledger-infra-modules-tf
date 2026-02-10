output "key_id" {
    value = google_kms_crypto_key.db_key.id
    }

output "secret_name" {
  value       = google_secret_manager_secret.db_password.secret_id
  description = "The short name of the secret created"
}