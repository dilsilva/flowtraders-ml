
resource "google_project_service" "gcp_services" {
  for_each = toset(var.gcp_service_list)
  project  = var.project_id
  service  = each.key
}

provider "google" {
  project = var.project_id
  region  = var.region
}

provider "google-beta" {
  project = var.project_id
  region  = var.region
}

module "networking" {
  source          = "./modules/networking"
  project_id      = var.project_id
  region          = var.region
  cidr_block      = var.network_cidr_block
  network_name    = var.network_name
  subnetwork_name = var.subnetwork_name
}

module "iap" {
  source      = "./modules/iap"
  project_id  = var.project_id
  iap_members = var.iam_users
}

module "iam" {
  source           = "./modules/iam"
  project_id       = var.project_id
  iam_users        = var.iam_users
  iam_roles        = var.iam_roles
  service_accounts = var.service_accounts
}

module "gke" {
  source          = "./modules/gke"
  project_id      = var.project_id
  region          = var.region
  cluster_name    = var.gke_cluster_name
  network_name    = module.networking.network_name
  subnetwork_name = module.networking.subnetwork_name
  gpu_node_config = var.gpu_node_config
}

module "cloudsql" {
  source                 = "./modules/cloudsql"
  project_id             = var.project_id
  region                 = var.region
  database_name          = var.database_name
  cloudsql_instance_type = var.cloudsql_instance_type
  network_uri            = module.networking.network_uri
}

module "storage" {
  source             = "./modules/storage"
  project_id         = var.project_id
  region             = var.region
  bucket_name        = var.bucket_name
  filestore_name     = var.filestore_name
  filestore_capacity = var.filestore_capacity
  filestore_location = var.filestore_location
  network_name       = module.networking.network_name
}
