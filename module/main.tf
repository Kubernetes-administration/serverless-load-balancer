module "lb-http" {
  source = "../google/"

  project                         = var.project
  name                            = "${var.project}-lb"
  network_endpoint_type           = var.network_endpoint_type
  region                          = var.region
  image                           = var.image
  ssl                             = false
  managed_ssl_certificate_domains = ["your-domain.com"]
  https_redirect                  = true
  backends                        = var.backends
  http_port_range                 = var.http_port_range
  https_port_range                = var.https_port_range
  ip_version                      = var.ip_version
}