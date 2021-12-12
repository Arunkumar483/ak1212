output "PublicDNS" {
    value = aws_lb.akalb.dns_name
}

output "ec2_instances" {
    value = aws_instance.akinstances
}