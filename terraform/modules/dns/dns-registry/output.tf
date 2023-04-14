output "nameservers" {
    value = aws_route53_zone.dns_zone.name_servers
}

output "environment_url" {
  value = "https://${aws_route53_zone.dns_zone.name}/"
}

output "zone_id" {
  value = aws_route53_zone.dns_zone.id
}