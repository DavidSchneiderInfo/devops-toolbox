output "environment_name" {
  value = terraform.workspace == "default" ? "dev" : terraform.workspace
}

output "node_ssh_login" {
  value = "ubuntu@${module.docker-node.node_ip}"
}

output "node_ssh_key" {
  value = module.docker-node.private_key
}

#output "environment_url" {
#  value = module.dns.environment_url
#}
#
#output "nameserver" {
#  value = module.dns.nameserver
#}