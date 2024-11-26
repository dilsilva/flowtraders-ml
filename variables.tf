
variable "project_id" {}
variable "region" {}
variable "network_cidr_block" {}
variable "network_name" {}
variable "subnetwork_name" {}
variable "iam_users" {
  type = map(string)
}
variable "iam_roles" {
  type = string
}
variable "service_accounts" {
  type = map(string)
}
variable "gke_cluster_name" {}
variable "gpu_node_config" {
  type = object({
    machine_type     = string
    accelerator_type = string
    count            = number
  })
}
variable "database_name" {}
variable "cloudsql_instance_type" {}
variable "bucket_name" {}
variable "filestore_name" {}
variable "filestore_capacity" {}
variable "filestore_location" {}
variable "gcp_service_list" {
  description = "The list of apis necessary for the project"
  type        = list(string)
  default = [
    "serviceusage.googleapis.com",
    "servicemanagement.googleapis.com",
    "servicecontrol.googleapis.com",
    "servicenetworking.googleapis.com",
    "file.googleapis.com",
    "compute.googleapis.com",
    "container.googleapis.com",
    "iam.googleapis.com",
    "iap.googleapis.com",
    "cloudresourcemanager.googleapis.com",
    "ml.googleapis.com",
    "sqladmin.googleapis.com",
    "meshconfig.googleapis.com",
    "krmapihosting.googleapis.com",
    "endpoints.googleapis.com",
    "cloudbuild.googleapis.com",
    "cloudresourcemanager.googleapis.com",
  ]
}