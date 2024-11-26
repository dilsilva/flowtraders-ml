
project_id         = "project_name"
region             = "us-central1"
network_cidr_block = "10.0.0.0/16"
network_name       = "kfvpc"
subnetwork_name    = "kf-subnet"

iam_users = {
  "user1" = "user:example-user1@gmail.com"
  "user2" = "user:example-user2@gmail.com"
}

iam_roles = "roles/editor"

service_accounts = {
  "sa1" = "example-sa1"
  "sa2" = "example-sa2"
}

gke_cluster_name = "primary-gke-cluster"

gpu_node_config = {
  machine_type     = "a2-highgpu-1g"
  accelerator_type = "nvidia-tesla-a100"
  count            = 1
}

database_name          = "my-database"
cloudsql_instance_type = "db-n1-standard-2"
bucket_name            = "bucket-test-flowtraders-disilva"
filestore_name         = "my-filestore"
filestore_capacity     = 1024
filestore_location     = "us-central1-a"
