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
}