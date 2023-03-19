module "network" {
  source = "./modules/network"

  environment_name = terraform.workspace == "default" ? "dev" : terraform.workspace
}

module "docker-node" {
  source = "./modules/docker-node"

  domain_name = var.domain_name
  environment_name = terraform.workspace == "default" ? "dev" : terraform.workspace
  region = var.region
  availability_zone = var.availability_zone
  allow_all_egress_name = module.network.allow_all_egress
  allow_sss_ingress_name = module.network.allow_ssh
  allow_https_ingress_name = module.network.allow_https
  allow_http_ingress_name = module.network.allow_http
}

#module "dns" {
#  source = "./modules/dns"
#
#  domain_name = var.domain_name
#  environment_name = terraform.workspace == "default" ? "dev" : terraform.workspace
#}