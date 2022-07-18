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

variable "enable_cdn" {
  type        = bool
  description = "value"
}

variable "managed_ssl_certificate_domains" {
  type        = list(string)
  description = "value"
}

variable "http_port_range" {
  type        = string
  description = "value"
}

variable "https_port_range" {
  type        = string
  description = "value"
}

variable "ip_version" {
  type        = string
  description = "value"
}

variable "https_redirect" {
  type        = bool
  description = "value"
}

variable "redirect_response_code" {
  type        = string
  description = "value"
}

variable "strip_query" {
  type        = bool
  description = "value"
}