resource "aws_route53_zone" "main" {
  name = "${var.environment_name}.${var.domain_name}"

    tags = {
        Environment = var.environment_name
    }
}