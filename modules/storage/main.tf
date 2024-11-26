
resource "google_storage_bucket" "bucket" {
  name          = var.bucket_name
  location      = var.region
  storage_class = "STANDARD"
}

resource "google_filestore_instance" "filestore" {
  name     = var.filestore_name
  tier     = "STANDARD"
  location = var.filestore_location
  file_shares {
    capacity_gb = var.filestore_capacity
    name        = "kf-share"
  }
  networks {
    network = var.network_name
    modes   = ["MODE_IPV4"]
  }
}
