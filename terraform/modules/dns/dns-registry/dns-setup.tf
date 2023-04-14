resource "aws_route53_zone" "dns_zone" {
  name  = "${var.environment_name}.${var.domain_name}"

  tags  = {
    Environment = var.environment_name
  }
}

resource "aws_route53_record" "register_dns" {
  zone_id = var.dns_registry_id
  name    = aws_route53_zone.dns_zone.name
  type    = "NS"
  ttl     = 300
  records = aws_route53_zone.dns_zone.name_servers
}