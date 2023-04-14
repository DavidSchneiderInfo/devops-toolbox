resource "aws_route53_zone" "dns_zone" {
  name = "${var.environment_name}.${var.domain_name}"

  tags = {
    Environment = var.environment_name
  }
}

resource "aws_route53_record" "dns_root_record" {
  zone_id = aws_route53_zone.dns_zone.zone_id
  name    = "${var.environment_name}.${var.domain_name}"
  type    = "A"
  ttl     = 300
  records = [var.root_ip]
}

resource "aws_route53_record" "register_dns" {
  zone_id = var.dns_registry_id
  name    = "${var.environment_name}.${var.domain_name}"
  type    = "NS"
  ttl     = 300
  records = aws_route53_zone.dns_zone.name_servers
}