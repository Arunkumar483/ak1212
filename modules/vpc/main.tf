resource "aws_vpc" "akvpc" {
  cidr_block       = var.cidr
  instance_tenancy = "default"

  tags = {
    Name        = var.vpc_name
    environment = "training"
  }
}


resource "aws_internet_gateway" "akig" {
  vpc_id = aws_vpc.akvpc.id

  tags = {
    Name        = "${var.vpc_name}-ig"
    environment = "training"
  }
}
