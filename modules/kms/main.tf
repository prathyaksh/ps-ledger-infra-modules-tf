resource "google_kms_key_ring" "keyring" {
  name     = "${var.name}-keyring"
  location = var.region
}

resource "google_kms_crypto_key" "db_key" {
  name     = var.db_key_name
  key_ring = google_kms_key_ring.keyring.id
  purpose  = "ENCRYPT_DECRYPT"
}

output "key_id" { value = google_kms_crypto_key.db_key.id }