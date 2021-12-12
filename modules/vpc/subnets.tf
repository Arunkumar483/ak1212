resource "aws_subnet" "aksubnets" {
  vpc_id            = aws_vpc.akvpc.id
  cidr_block        = var.subnet_cidrs[count.index]

  availability_zone = var.subnet_azs[count.index]
  count         = length(var.subnet_azs)
#   no. of subnets created is equal to no of azs in root variable subnet_azs
  tags = {
    Name        = "${var.vpc_name}-${count.index<2?"Public":"Private"}-${var.subnet_azs[count.index]}"
    environment = "training"
  }
}