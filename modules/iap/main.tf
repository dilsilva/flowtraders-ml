
resource "google_iap_web_type_compute_iam_binding" "iap" {
  project = var.project_id
  role    = "roles/iap.httpsResourceAccessor"
  members = values(var.iap_members)
}
