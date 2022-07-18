## Requirements

No requirements.

## Providers

No providers.

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_lb-http"></a> [lb-http](#module\_lb-http) | ../google/ | n/a |

## Resources

No resources.

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_enable_cdn"></a> [enable\_cdn](#input\_enable\_cdn) | value | `bool` | n/a | yes |
| <a name="input_group"></a> [group](#input\_group) | n/a | `string` | n/a | yes |
| <a name="input_http_port_range"></a> [http\_port\_range](#input\_http\_port\_range) | value | `string` | n/a | yes |
| <a name="input_https_port_range"></a> [https\_port\_range](#input\_https\_port\_range) | value | `string` | n/a | yes |
| <a name="input_https_redirect"></a> [https\_redirect](#input\_https\_redirect) | value | `bool` | n/a | yes |
| <a name="input_image"></a> [image](#input\_image) | n/a | `string` | n/a | yes |
| <a name="input_ip_version"></a> [ip\_version](#input\_ip\_version) | value | `string` | n/a | yes |
| <a name="input_managed_ssl_certificate_domains"></a> [managed\_ssl\_certificate\_domains](#input\_managed\_ssl\_certificate\_domains) | value | `list(string)` | n/a | yes |
| <a name="input_name"></a> [name](#input\_name) | n/a | `string` | n/a | yes |
| <a name="input_network_endpoint_type"></a> [network\_endpoint\_type](#input\_network\_endpoint\_type) | n/a | `string` | n/a | yes |
| <a name="input_project"></a> [project](#input\_project) | n/a | `string` | n/a | yes |
| <a name="input_redirect_response_code"></a> [redirect\_response\_code](#input\_redirect\_response\_code) | value | `string` | n/a | yes |
| <a name="input_region"></a> [region](#input\_region) | n/a | `string` | n/a | yes |
| <a name="input_strip_query"></a> [strip\_query](#input\_strip\_query) | value | `bool` | n/a | yes |

## Outputs

No outputs.
