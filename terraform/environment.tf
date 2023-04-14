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
  allow_ssh_ingress_name = module.network.allow_ssh
  allow_https_ingress_name = module.network.allow_https
  allow_http_ingress_name = module.network.allow_http
  node_volume_size = var.node_volume_size
}

module "dns" {
  source = "./modules/dns"

  dns_registry_id = var.dns_registry_id
  domain_name = var.domain_name
  environment_name = terraform.workspace == "default" ? "dev" : terraform.workspace
  root_ip = module.docker-node.node_ip
}