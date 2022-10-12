output "environment_name" {
  value = "${terraform.workspace == "default" ? "dev" : terraform.workspace}"
}

output "environment_url" {
  value = module.dns.environment_url
}

output "node_ssh_login" {
  value = "ubuntu@${module.node.node_ip}"
}

output "node_ssh_key" {
  value = module.node.private_key
}

output "nameserver" {
  value = module.dns.nameserver
}