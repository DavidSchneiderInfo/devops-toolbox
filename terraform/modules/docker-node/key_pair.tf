resource "tls_private_key" "private_key" {
    algorithm   =  "RSA"
    rsa_bits    =  4096
}

resource "local_file" "private_key" {
    content         =  tls_private_key.private_key.private_key_pem
    filename        =  "/tmp/terraform/node_key.pem"
    file_permission =  0400
}

resource "aws_key_pair" "public_key" {
    key_name   = "${var.environment_name} docker-node public key"
    public_key = tls_private_key.private_key.public_key_openssh

    tags = {
        Environment = var.environment_name
    }
}