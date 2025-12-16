resource "google_project_iam_member" "compute" {
  project = var.tenant_project_id
  role    = "roles/compute.admin"
  member  = "user:mike.pietruszka@sada.com"
}