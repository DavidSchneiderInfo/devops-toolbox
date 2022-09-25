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

module "dns" {
  source = "./dns"

  domain_name = var.domain_name
}

module "k8s" {
  source = "./k8s"
}