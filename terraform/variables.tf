variable "domain_name" {
  type = string
}

output "nameserver" {
  value = module.dns.nameserver
}