project                         = "gcp-terraform-env"
group                           = ""
name                            = "cloudrun-neg"
network_endpoint_type           = "SERVERLESS"
region                          = "us-central1"
image                           = "us-docker.pkg.dev/cloudrun/container/hello"
managed_ssl_certificate_domains = ["your-domain.com"]
http_port_range                 = "80"
https_port_range                = "443"
ip_version                      = "IPV4"

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