module "lb-http" {
  source = "../google/"

  project = var.project
  name    = "${var.project}-lb"

  ssl                             = false
  managed_ssl_certificate_domains = ["your-domain.com"]
  https_redirect                  = true
  backends = {
    default = {
      description             = null
      enable_cdn              = false
      custom_request_headers  = null
      custom_response_headers = null
      security_policy         = null


      log_config = {
        enable      = true
        sample_rate = 1.0
      }

      groups = [
        {
          group = module.network_group.endpoint
        },
        # {
        #   group = module.instance_group.group
        # }
      ]

      iap_config = {
        enable               = false
        oauth2_client_id     = null
        oauth2_client_secret = null
      }
    }
  }
}

module "network_group" {
  source = "../cloud-run"

  project               = var.project
  name                  = "${var.name}-network-group"
  network_endpoint_type = var.network_endpoint_type
  region                = var.region
  image                 = var.image
}

module "instance_group" {
  source = "../instance-group"

  project = var.project
  name    = "${var.name}-instance-group"
  zone    = var.zone
}


