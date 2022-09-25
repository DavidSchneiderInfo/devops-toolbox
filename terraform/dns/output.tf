output "nameserver" {
    value = aws_route53_zone.main.name_servers
}