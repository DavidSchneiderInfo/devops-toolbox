resource "aws_security_group" "allow_all_egress" {
    name        = "${var.environment_name}_allow_all_egress"
    description = "Allow all egress traffic"

    egress {
        from_port   = 0
        to_port     = 0
        protocol    = "-1"
        cidr_blocks = ["0.0.0.0/0"]
    }

    tags = {
        Name = "allow_all_egress"
        Environment = var.environment_name
    }
}


resource "aws_security_group" "allow_http" {
    name        = "${var.environment_name}_allow_http"
    description = "Allow http inbound traffic"

    ingress {
        description = "http"
        from_port   = 80
        to_port     = 80
        protocol    = "tcp"
        cidr_blocks = ["0.0.0.0/0"] 
    }
    
    egress {
        from_port   = 0
        to_port     = 0
        protocol    = "-1"
        cidr_blocks = ["0.0.0.0/0"]
    }

    tags = {
        Name = "allow_http"
        Environment = var.environment_name
    }
}

resource "aws_security_group" "allow_https" {
    name        = "${var.environment_name}_allow_https"
    description = "Allow https inbound traffic"

    ingress {
        description = "http"
        from_port   = 443
        to_port     = 443
        protocol    = "tcp"
        cidr_blocks = ["0.0.0.0/0"] 
    }

    tags = {
        Name = "allow_https"
        Environment = var.environment_name
    }
}

resource "aws_security_group" "allow_ssh" {
    name        = "${var.environment_name}_allow_ssh"
    description = "Allow ssh inbound traffic"

    ingress {
        description = "http"
        from_port   = 22
        to_port     = 22
        protocol    = "tcp"
        cidr_blocks = ["0.0.0.0/0"] 
    }

    tags = {
        Name = "allow_ssh"
        Environment = var.environment_name
    }
}
