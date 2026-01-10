output "sa_id" {
  value = one(google_service_account.sa_creation[*].account_id)
}

output "sa_email" {
  value = one(google_service_account.sa_creation[*].email)
}