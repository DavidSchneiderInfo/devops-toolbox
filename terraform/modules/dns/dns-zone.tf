module "dns-registry" {
  source = "./dns-registry"

  count = var.is_prod ? 0 : 1

  dns_registry_id = var.dns_registry_id
  domain_name = var.domain_name
  environment_name = var.environment_name
}

resource "aws_route53_record" "dns_root_record" {
  name    = var.is_prod ? var.domain_name : "${var.environment_name}.${var.domain_name}"
  zone_id = var.is_prod ? var.dns_registry_id : module.dns-registry[0].zone_id
  type    = "A"
  ttl     = 300
  records = [var.root_ip]
}