resource "aws_route_table" "akrts" {
  vpc_id = aws_vpc.akvpc.id
# if the rt is public then associate ig else continue
  dynamic route {
      for_each = toset(count.index==0?[1]:[])
      content{
        cidr_block = "0.0.0.0/0"
        gateway_id = aws_internet_gateway.akig.id
      }
  }

  count = var.route_table_count

  tags = {
    Name = "aktf-${count.index==1?"Private":"Public"}RT"
    environment="training"
  }
}

resource "aws_route_table_association" "akrtas" {
  subnet_id      = aws_subnet.aksubnets[count.index].id
  route_table_id = aws_route_table.akrts[count.index<2?0:1].id
  count = var.route_table_count*2
}