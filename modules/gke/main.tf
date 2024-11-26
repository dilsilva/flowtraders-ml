
resource "google_container_cluster" "primary" {
  project             = var.project_id
  name                = var.cluster_name
  location            = var.region
  network             = var.network_name
  subnetwork          = var.subnetwork_name
  initial_node_count  = 1
  deletion_protection = false
}

resource "google_container_node_pool" "gpu" {
  name     = "gpu-node-pool"
  cluster  = google_container_cluster.primary.name
  location = var.region

  node_config {
    machine_type = var.gpu_node_config.machine_type
    guest_accelerator {
      type  = var.gpu_node_config.accelerator_type
      count = var.gpu_node_config.count
    }
  }
}
