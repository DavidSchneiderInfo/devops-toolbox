output "environment_name" {
    value = var.environment_name
}

output "node_ip" {
  value = aws_eip.node_eip.public_ip
}

output "private_key" {
    value = local_file.private_key.filename
}