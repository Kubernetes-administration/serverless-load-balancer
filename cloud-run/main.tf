
// Cloud Run Example
resource "google_compute_region_network_endpoint_group" "default" {
  project               = var.project
  name                  = var.name
  network_endpoint_type = var.network_endpoint_type
  region                = var.region
  cloud_run {
    service = google_cloud_run_service.default.name
  }
}

resource "google_cloud_run_service" "default" {
  project  = var.project
  name     = var.name
  location = var.region

  template {
    spec {
      containers {
        image = var.image
      }
    }
  }

  traffic {
    percent         = 100
    latest_revision = true
  }
}