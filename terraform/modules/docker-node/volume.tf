resource "aws_ebs_volume" "node_volume" {
  availability_zone = var.availability_zone
  size              = var.node_volume_size

  tags = {
    Name = "${var.environment_name} docker volume"
    Environment = var.environment_name
  }
}

resource "aws_volume_attachment" "node_volume_attachment" {
  device_name  = "/dev/sdd"
  volume_id   = aws_ebs_volume.node_volume.id
  instance_id = aws_instance.node_instance.id
  force_detach = true
}