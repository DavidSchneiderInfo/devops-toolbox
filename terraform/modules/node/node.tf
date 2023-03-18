data "aws_ami" "node_ami" {
    owners = ["self"]
    filter {
        name   = "name"
        values = ["docker-node"]
    }
}

resource "aws_instance" "node_instance" {
    ami           = data.aws_ami.node_ami.id
    instance_type = "t2.micro" 
    key_name = aws_key_pair.public_key.key_name
    availability_zone = var.availability_zone
    security_groups = [
        var.allow_all_egress_name,
        var.allow_sss_ingress_name,
        var.allow_https_ingress_name,
        var.allow_http_ingress_name
    ]

    tags = {
        Name = "Node ${var.environment_name}"
        Environment = var.environment_name
        AnsibleGroup = "Node"
    }
}

resource "aws_eip" "node_eip" {
    instance = aws_instance.node_instance.id

    tags = {
        Name = "node_eip"
        Environment = var.environment_name
    }
}