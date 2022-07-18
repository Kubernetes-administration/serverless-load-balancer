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
  backends = {
    default = {
      description             = null
      enable_cdn              = true
      custom_request_headers  = null
      custom_response_headers = null
      security_policy         = null


      log_config = {
        enable      = true
        sample_rate = 1.0
      }

      groups = [
        {
          # Your serverless service should have a NEG created that's referenced here.
          group = ""
        }
      ]

      iap_config = {
        enable               = false
        oauth2_client_id     = null
        oauth2_client_secret = null
      }
    }
  }
}