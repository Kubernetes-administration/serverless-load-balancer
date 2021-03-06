locals {
  address                 = var.create_address ? join("", google_compute_global_address.default.*.address) : var.address
  url_map                 = var.create_url_map ? join("", google_compute_url_map.default.*.self_link) : var.url_map
  create_http_forward     = var.http_forward || var.https_redirect
  health_checked_backends = {}
}