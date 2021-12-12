output "subnets" {
  value = [
      for subnet in aws_subnet.aksubnets : subnet.id
  ]
}

output "vpc_id" {
    value = aws_vpc.akvpc.id
}