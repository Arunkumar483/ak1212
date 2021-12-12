resource "aws_instance" "akinstances" {
  ami                         = var.ami
  instance_type               = var.instance_type
  security_groups             = var.security_groups
  key_name                    = var.key_pair
  subnet_id                   = var.public_subnets[count.index]
  associate_public_ip_address = true

  count = var.instance_count

  user_data = file(var.file_path)

  tags = {
    Name        = "${var.instance_name}-ec2-${count.index+1}"
    environment = "training"
  }
}
