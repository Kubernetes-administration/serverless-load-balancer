# output "cloud_run_id" {
#   value = google_cloud_run_service.default[*].self_link
# }

output "endpoint" {
  value = google_compute_region_network_endpoint_group.default.id
}