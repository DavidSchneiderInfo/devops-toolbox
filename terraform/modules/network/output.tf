output "environment_name" {
    value = var.environment_name
}

output "allow_all_egress" {
    value = aws_security_group.allow_all_egress.name
}

output "allow_ssh" {
    value = aws_security_group.allow_ssh.name
}

output "allow_https" {
    value = aws_security_group.allow_https.name
}

output "allow_http" {
    value = aws_security_group.allow_http.name
}