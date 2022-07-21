resource "google_compute_global_forwarding_rule" "http" {
  project    = var.project
  count      = local.create_http_forward ? 1 : 0
  name       = var.name
  target     = google_compute_target_http_proxy.default[0].self_link
  ip_address = local.address
  port_range = var.http_port_range
  labels     = var.labels
}

resource "google_compute_global_forwarding_rule" "https" {
  project    = var.project
  count      = var.ssl ? 1 : 0
  name       = "${var.name}-https"
  target     = google_compute_target_https_proxy.default[0].self_link
  ip_address = local.address
  port_range = var.https_port_range
  labels     = var.labels
}

resource "google_compute_global_address" "default" {
  count      = var.create_address ? 1 : 0
  project    = var.project
  name       = "${var.name}-global-address"
  ip_version = var.ip_version
}

resource "google_compute_target_http_proxy" "default" {
  project = var.project
  count   = local.create_http_forward ? 1 : 0
  name    = "${var.name}-http-proxy"
  url_map = var.https_redirect == false ? local.url_map : join("", google_compute_url_map.https_redirect.*.self_link)
}

resource "google_compute_target_https_proxy" "default" {
  project = var.project
  count   = var.ssl ? 1 : 0
  name    = "${var.name}-https-proxy"
  url_map = local.url_map

  ssl_certificates = compact(concat(var.ssl_certificates, google_compute_ssl_certificate.default.*.self_link, google_compute_managed_ssl_certificate.default.*.self_link, ), )
  ssl_policy       = var.ssl_policy
  quic_override    = var.quic ? "ENABLE" : null
}

resource "google_compute_ssl_certificate" "default" {
  project     = var.project
  count       = var.ssl && length(var.managed_ssl_certificate_domains) == 0 && !var.use_ssl_certificates ? 1 : 0
  name_prefix = "${var.name}-certificate-"
  private_key = var.private_key
  certificate = var.certificate

  lifecycle {
    create_before_destroy = true
  }
}

resource "google_compute_managed_ssl_certificate" "default" {
  project = var.project
  count   = var.ssl && length(var.managed_ssl_certificate_domains) > 0 && !var.use_ssl_certificates ? 1 : 0
  name    = "cert"
  lifecycle {
    create_before_destroy = true
  }
  managed {
    domains = var.managed_ssl_certificate_domains
  }
}

resource "google_compute_url_map" "default" {
  project         = var.project
  count           = var.create_url_map ? 1 : 0
  name            = "${var.name}-url-map-default"
  default_service = google_compute_backend_bucket.image_backend.self_link
}

resource "google_compute_url_map" "https_redirect" {
  project = var.project
  count   = var.https_redirect ? 1 : 0
  name    = "${var.name}-url-map-https-redirect"
  default_url_redirect {
    https_redirect         = true
    redirect_response_code = "MOVED_PERMANENTLY_DEFAULT"
    strip_query            = false
  }
}

# resource "google_compute_backend_service" "default" {
#   project    = var.project
#   name       = "${var.project}-backend-service"
#   enable_cdn = var.enable_cdn
#   backend {
#     group = google_compute_region_network_endpoint_group.default.id
#   }
# }

resource "google_compute_backend_bucket" "image_backend" {
  project     = var.project
  name        = "${var.project}-backend-bucket"
  bucket_name = google_storage_bucket.image_bucket.name
  enable_cdn  = var.enable_cdn
}

resource "google_storage_bucket" "image_bucket" {
  project  = var.project
  name     = var.name
  location = var.location
}
