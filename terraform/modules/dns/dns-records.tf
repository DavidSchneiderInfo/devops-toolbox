resource "aws_route53_record" "www" {
  name    = "www.${aws_route53_record.dns_root_record.name}"
  zone_id = aws_route53_record.dns_root_record.zone_id
  type    = "A"
  ttl     = 300
  records = [var.root_ip]
}

resource "aws_route53_record" "monitor" {
  name    = "monitor.${aws_route53_record.dns_root_record.name}"
  zone_id = aws_route53_record.dns_root_record.zone_id
  type    = "A"
  ttl     = 300
  records = [var.root_ip]
}