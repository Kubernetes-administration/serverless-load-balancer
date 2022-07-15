resource "google_compute_instance_group" "default" {
  project = var.project
  zone    = var.zone
  name    = var.name
}