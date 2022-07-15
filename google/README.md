## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 0.13 |
| <a name="requirement_google"></a> [google](#requirement\_google) | >= 3.53, < 5.0 |
| <a name="requirement_google-beta"></a> [google-beta](#requirement\_google-beta) | >= 3.53, < 5.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_google"></a> [google](#provider\_google) | >= 3.53, < 5.0 |
| <a name="provider_google-beta"></a> [google-beta](#provider\_google-beta) | >= 3.53, < 5.0 |
| <a name="provider_random"></a> [random](#provider\_random) | n/a |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [google-beta_google_compute_backend_service.default](https://registry.terraform.io/providers/hashicorp/google-beta/latest/docs/resources/google_compute_backend_service) | resource |
| [google-beta_google_compute_global_address.default](https://registry.terraform.io/providers/hashicorp/google-beta/latest/docs/resources/google_compute_global_address) | resource |
| [google-beta_google_compute_global_address.default_ipv6](https://registry.terraform.io/providers/hashicorp/google-beta/latest/docs/resources/google_compute_global_address) | resource |
| [google-beta_google_compute_global_forwarding_rule.http](https://registry.terraform.io/providers/hashicorp/google-beta/latest/docs/resources/google_compute_global_forwarding_rule) | resource |
| [google-beta_google_compute_global_forwarding_rule.http_ipv6](https://registry.terraform.io/providers/hashicorp/google-beta/latest/docs/resources/google_compute_global_forwarding_rule) | resource |
| [google-beta_google_compute_global_forwarding_rule.https](https://registry.terraform.io/providers/hashicorp/google-beta/latest/docs/resources/google_compute_global_forwarding_rule) | resource |
| [google-beta_google_compute_global_forwarding_rule.https_ipv6](https://registry.terraform.io/providers/hashicorp/google-beta/latest/docs/resources/google_compute_global_forwarding_rule) | resource |
| [google-beta_google_compute_managed_ssl_certificate.default](https://registry.terraform.io/providers/hashicorp/google-beta/latest/docs/resources/google_compute_managed_ssl_certificate) | resource |
| [google_compute_ssl_certificate.default](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/compute_ssl_certificate) | resource |
| [google_compute_target_http_proxy.default](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/compute_target_http_proxy) | resource |
| [google_compute_target_https_proxy.default](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/compute_target_https_proxy) | resource |
| [google_compute_url_map.default](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/compute_url_map) | resource |
| [google_compute_url_map.https_redirect](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/compute_url_map) | resource |
| [random_id.certificate](https://registry.terraform.io/providers/hashicorp/random/latest/docs/resources/id) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_address"></a> [address](#input\_address) | Existing IPv4 address to use (the actual IP address value) | `string` | `null` | no |
| <a name="input_backends"></a> [backends](#input\_backends) | Map backend indices to list of backend maps. | <pre>map(object({<br><br>    description             = string<br>    enable_cdn              = bool<br>    security_policy         = string<br>    custom_request_headers  = list(string)<br>    custom_response_headers = list(string)<br><br><br><br>    log_config = object({<br>      enable      = bool<br>      sample_rate = number<br>    })<br><br>    groups = list(object({<br>      group = string<br><br>    }))<br>    iap_config = object({<br>      enable               = bool<br>      oauth2_client_id     = string<br>      oauth2_client_secret = string<br>    })<br>  }))</pre> | n/a | yes |
| <a name="input_cdn"></a> [cdn](#input\_cdn) | Set to `true` to enable cdn on backend. | `bool` | `false` | no |
| <a name="input_certificate"></a> [certificate](#input\_certificate) | Content of the SSL certificate. Required if `ssl` is `true` and `ssl_certificates` is empty. | `string` | `null` | no |
| <a name="input_create_address"></a> [create\_address](#input\_create\_address) | Create a new global IPv4 address | `bool` | `true` | no |
| <a name="input_create_ipv6_address"></a> [create\_ipv6\_address](#input\_create\_ipv6\_address) | Allocate a new IPv6 address. Conflicts with "ipv6\_address" - if both specified, "create\_ipv6\_address" takes precedence. | `bool` | `false` | no |
| <a name="input_create_url_map"></a> [create\_url\_map](#input\_create\_url\_map) | Set to `false` if url\_map variable is provided. | `bool` | `true` | no |
| <a name="input_enable_ipv6"></a> [enable\_ipv6](#input\_enable\_ipv6) | Enable IPv6 address on the CDN load-balancer | `bool` | `false` | no |
| <a name="input_group"></a> [group](#input\_group) | n/a | `string` | `""` | no |
| <a name="input_http_forward"></a> [http\_forward](#input\_http\_forward) | Set to `false` to disable HTTP port 80 forward | `bool` | `true` | no |
| <a name="input_https_redirect"></a> [https\_redirect](#input\_https\_redirect) | Set to `true` to enable https redirect on the lb. | `bool` | `false` | no |
| <a name="input_ipv6_address"></a> [ipv6\_address](#input\_ipv6\_address) | An existing IPv6 address to use (the actual IP address value) | `string` | `null` | no |
| <a name="input_labels"></a> [labels](#input\_labels) | The labels to attach to resources created by this module | `map(string)` | `{}` | no |
| <a name="input_managed_ssl_certificate_domains"></a> [managed\_ssl\_certificate\_domains](#input\_managed\_ssl\_certificate\_domains) | Create Google-managed SSL certificates for specified domains. Requires `ssl` to be set to `true` and `use_ssl_certificates` set to `false`. | `list(string)` | `[]` | no |
| <a name="input_name"></a> [name](#input\_name) | Name for the forwarding rule and prefix for supporting resources | `string` | n/a | yes |
| <a name="input_private_key"></a> [private\_key](#input\_private\_key) | Content of the private SSL key. Required if `ssl` is `true` and `ssl_certificates` is empty. | `string` | `null` | no |
| <a name="input_project"></a> [project](#input\_project) | The project to deploy to, if not set the default provider project is used. | `string` | n/a | yes |
| <a name="input_quic"></a> [quic](#input\_quic) | Set to `true` to enable QUIC support | `bool` | `false` | no |
| <a name="input_random_certificate_suffix"></a> [random\_certificate\_suffix](#input\_random\_certificate\_suffix) | Bool to enable/disable random certificate name generation. Set and keep this to true if you need to change the SSL cert. | `bool` | `false` | no |
| <a name="input_security_policy"></a> [security\_policy](#input\_security\_policy) | The resource URL for the security policy to associate with the backend service | `string` | `null` | no |
| <a name="input_ssl"></a> [ssl](#input\_ssl) | Set to `true` to enable SSL support, requires variable `ssl_certificates` - a list of self\_link certs | `bool` | `false` | no |
| <a name="input_ssl_certificates"></a> [ssl\_certificates](#input\_ssl\_certificates) | SSL cert self\_link list. Required if `ssl` is `true` and no `private_key` and `certificate` is provided. | `list(string)` | `[]` | no |
| <a name="input_ssl_policy"></a> [ssl\_policy](#input\_ssl\_policy) | Selfink to SSL Policy | `string` | `null` | no |
| <a name="input_url_map"></a> [url\_map](#input\_url\_map) | The url\_map resource to use. Default is to send all traffic to first backend. | `string` | `null` | no |
| <a name="input_use_ssl_certificates"></a> [use\_ssl\_certificates](#input\_use\_ssl\_certificates) | If true, use the certificates provided by `ssl_certificates`, otherwise, create cert from `private_key` and `certificate` | `bool` | `false` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_backend_services"></a> [backend\_services](#output\_backend\_services) | The backend service resources. |
| <a name="output_external_ip"></a> [external\_ip](#output\_external\_ip) | The external IPv4 assigned to the global fowarding rule. |
| <a name="output_external_ipv6_address"></a> [external\_ipv6\_address](#output\_external\_ipv6\_address) | The external IPv6 assigned to the global fowarding rule. |
| <a name="output_http_proxy"></a> [http\_proxy](#output\_http\_proxy) | The HTTP proxy used by this module. |
| <a name="output_https_proxy"></a> [https\_proxy](#output\_https\_proxy) | The HTTPS proxy used by this module. |
| <a name="output_ipv6_enabled"></a> [ipv6\_enabled](#output\_ipv6\_enabled) | Whether IPv6 configuration is enabled on this load-balancer |
| <a name="output_url_map"></a> [url\_map](#output\_url\_map) | The default URL map used by this module. |
