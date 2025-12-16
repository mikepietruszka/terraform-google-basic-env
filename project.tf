data "google_project" "project" {
  project_id = "prj-g-tfseed-4200"
}

output "project_number" {
  value = data.google_project.project.number
}


resource "random_integer" "random" {
  min = 1000
  max = 9999
}

/*// Wait for services to be enabled
resource "time_sleep" "wait_30_seconds" {
  depends_on      = [data.google_project.project]
  create_duration = "30s"
}

// Enable services
resource "google_project_service" "compute" {
  project    = data.google_project.project.project_id
  service    = "compute.googleapis.com"
  depends_on = [time_sleep.wait_30_seconds]
  disable_on_destroy = false
  disable_dependent_services = false
}*/
