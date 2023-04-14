resource "aws_eip" "node_eip" {
  instance = aws_instance.node_instance.id

  tags = {
    Name = "node_eip"
    Environment = var.environment_name
  }
}