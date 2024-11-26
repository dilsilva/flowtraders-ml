
resource "google_compute_network" "main" {
  project                 = var.project_id
  name                    = var.network_name
  auto_create_subnetworks = false
}

resource "google_compute_subnetwork" "private" {
  name                     = var.subnetwork_name
  network                  = google_compute_network.main.id
  ip_cidr_range            = var.cidr_block
  private_ip_google_access = true
}

output "network_name" {
  value = google_compute_network.main.name
}

output "network_uri" {
  value = google_compute_network.main.self_link
}

output "subnetwork_name" {
  value = google_compute_subnetwork.private.name
}
