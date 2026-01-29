resource "random_id" "db_name_suffix" {
  byte_length = 4
}

resource "google_sql_database_instance" "postgres_instance" {
  name             = "${var.instance_name}-db-${var.environment}"
  database_version = var.database_version
  region           = var.region

  settings {
    tier = var.tier

    ip_configuration {
      ipv4_enabled    = false
      private_network = var.vpc_id
    }

    availability_type = var.availability_type
    
    backup_configuration {
      enabled                        = var.backup_enabled
      point_in_time_recovery_enabled = var.pitr_enabled
    }

    disk_autoresize       = var.disk_autoresize
    disk_autoresize_limit = var.disk_autoresize_limit
    disk_type             = var.disk_type
  }

  deletion_protection = true
}

# The specific "Ledger" Database inside the instance
resource "google_sql_database" "database" {
  name     = var.db_name
  instance = google_sql_database_instance.postgres_instance.name
}

data "google_secret_manager_secret_version" "db_password" {
  secret = "${var.name}-db-password"
}

resource "google_sql_user" "db_user" {
  name     = var.db_user_name
  instance = google_sql_database_instance.postgres_instance.name
  password = data.google_secret_manager_secret_version.db_password.secret_data
}