output "nameserver" {
    value = aws_route53_zone.main.name_servers
}

output "environment_name" {
  value = var.environment_name
}

output "environment_url" {
  value = "https://${aws_route53_zone.main.name}/"
}