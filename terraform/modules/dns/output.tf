output "nameservers" {
    value = module.dns-registry[0].nameservers
}

output "environment_url" {
  value = module.dns-registry[0].environment_url
}

output "environment_name" {
  value = var.environment_name
}

output "domain_name" {
  value = [
    aws_route53_record.www.name,
    aws_route53_record.monitor.name
  ]
}