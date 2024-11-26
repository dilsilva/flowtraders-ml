
resource "google_sql_database_instance" "mysql" {
  project          = var.project_id
  name             = var.database_name
  region           = var.region
  database_version = "MYSQL_8_0"

  settings {
    tier = var.cloudsql_instance_type
    ip_configuration {
      private_network = var.network_uri
    }
  }
}
