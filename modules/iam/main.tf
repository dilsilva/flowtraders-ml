
resource "google_project_iam_member" "users" {
  for_each = var.iam_users
  project  = var.project_id
  member   = each.value
  role     = var.iam_roles
}

resource "google_service_account" "service_accounts" {
  for_each     = var.service_accounts
  account_id   = each.value
  display_name = each.key
}
