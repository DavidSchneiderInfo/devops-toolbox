resource "aws_instance" "node_instance" {
    ami           = data.aws_ami.node_ami.id
    instance_type = "t2.micro" 
    key_name = aws_key_pair.public_key.key_name
    availability_zone = var.availability_zone
    security_groups = [
        var.allow_all_egress_name,
        var.allow_ssh_ingress_name,
        var.allow_https_ingress_name,
        var.allow_http_ingress_name
    ]

    tags = {
        Name = "${var.environment_name} docker node"
        Environment = var.environment_name
        AnsibleGroup = "docker_node"
        AnsibleHost = "yes"
    }

    user_data = data.template_file.node_instance_bootstrap.template

    lifecycle {
        create_before_destroy = true
    }
}

data "template_file" "node_instance_bootstrap" {
    template = file("${path.module}/bootstrap.sh")
}