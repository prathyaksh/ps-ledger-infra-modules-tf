# 1. Reserve the IP Range (The "Parking Lot")
resource "google_compute_global_address" "private_ip_alloc" {
  name          = var.peering_range_name
  purpose       = "VPC_PEERING"
  address_type  = "INTERNAL"
  prefix_length = var.prefix_length
  network       = var.vpc_id
  project       = var.project_id
  description   = var.description
}

# 2. Establish the Connection (The "Highway Bridge")
resource "google_service_networking_connection" "private_vpc_connection" {
  network                 = var.vpc_id
  service                 = "servicenetworking.googleapis.com"
  reserved_peering_ranges = [google_compute_global_address.private_ip_alloc.name]

  # Important for SRE: prevents accidental deletions of the peering 
  # if a Cloud SQL instance is still using it.
  deletion_policy = "ABANDON" 
}