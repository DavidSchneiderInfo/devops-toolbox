resource "aws_route53_zone" "main" {
  name = "${var.environment_name}.${var.domain_name}"

    tags = {
        Environment = var.environment_name
    }
}

resource "aws_route53_record" "root_record" {
  zone_id = aws_route53_zone.main.zone_id
  name    = "${var.environment_name}.${var.domain_name}"
  type    = "A"
  ttl     = 300
  records = [var.root_ip]
}