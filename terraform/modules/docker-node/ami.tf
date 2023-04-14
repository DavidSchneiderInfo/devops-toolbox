data "aws_ami" "node_ami" {
  owners = ["self"]
  filter {
    name   = "name"
    values = ["docker-node"]
  }
}