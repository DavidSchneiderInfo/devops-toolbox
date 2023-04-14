output "nameservers" {
    value = module.dns-registry[0].nameservers
}

output "environment_url" {
  value = module.dns-registry[0].environment_url
}

output "environment_name" {
  value = var.environment_name
}