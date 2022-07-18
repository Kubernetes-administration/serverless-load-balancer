# Global HTTP Load Balancer Terraform Module for Serverless NEGs

This submodule allows you to create Cloud HTTP(S) Load Balancer with
[Serverless Network Endpoint Groups (NEGs)](https://cloud.google.com/load-balancing/docs/negs/serverless-neg-concepts)
and place serverless services from Cloud Run, Cloud Functions and App Engine
behind a Cloud Load Balancer.

```HCL
module "lb-http" {
  source = "../google/"

  project = var.project
  name    = "${var.project}-lb"

  # ssl                             = true
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
          # Your serverless service should have a NEG created that's referenced here.
          # group = google_compute_region_network_endpoint_group.cloudrun_neg.id
          group = module.network_group.endpoint
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

module "network_group" {

  source                = "../cloud-run"
  project               = var.project
  name                  = var.name
  network_endpoint_type = var.network_endpoint_type
  region                = var.region
  image                 = var.image
}

```
## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_lb-http"></a> [lb-http](#module\_lb-http) | ../google/ | n/a |
| <a name="module_network_group"></a> [network\_group](#module\_network\_group) | ../cloud-run | n/a |


## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_group"></a> [group](#input\_group) | n/a | `string` | n/a | yes |
| <a name="input_image"></a> [image](#input\_image) | n/a | `string` | n/a | yes |
| <a name="input_name"></a> [name](#input\_name) | n/a | `string` | n/a | yes |
| <a name="input_network_endpoint_type"></a> [network\_endpoint\_type](#input\_network\_endpoint\_type) | n/a | `string` | n/a | yes |
| <a name="input_project"></a> [project](#input\_project) | n/a | `string` | n/a | yes |
| <a name="input_region"></a> [region](#input\_region) | n/a | `string` | n/a | yes |
