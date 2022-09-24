terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.0"
    }
  }
  backend "s3" {
  }
}

provider "aws" {
  region = "eu-central-1"
}

resource "aws_route53_zone" "main" {
  name = var.domain_name
}

variable "domain_name" {
  type = string
}