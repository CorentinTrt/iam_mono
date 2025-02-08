provider "google" {
  credentials = file(var.provisioner_sa_credentials)
  project     = var.project_id
  region      = var.region
}

resource "google_project_service" "iam" {
  service            = "iam.googleapis.com"
  disable_on_destroy = false
}
