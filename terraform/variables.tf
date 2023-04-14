variable "domain_name" {
  type = string
}

variable "dns_registry_id" {
  type = string
}

variable "region" {
  type = string
  default = "eu-central-1"
}

variable "availability_zone" {
    type = string
    default = "eu-central-1a"
}

variable "node_volume_size" {
  type = number
  default = 10
}