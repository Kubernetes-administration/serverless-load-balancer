variable "project" {
  type = string
}

variable "group" {
  type = string
}

variable "name" {
  type = string
}

variable "network_endpoint_type" {
  type = string
}

variable "region" {
  type = string
}

variable "image" {
  type = string
}


variable "backends" {
  description = "Map backend indices to list of backend maps."
  type = map(object({

    description             = string
    enable_cdn              = bool
    security_policy         = string
    custom_request_headers  = list(string)
    custom_response_headers = list(string)



    log_config = object({
      enable      = bool
      sample_rate = number
    })

    groups = list(object({
      group = string

    }))
    iap_config = object({
      enable               = bool
      oauth2_client_id     = string
      oauth2_client_secret = string
    })
  }))
}