variable "cidr" {
  description = "VPC cidr"
  type        = string
}
variable "vpc_name" {
  description = "VPC name"
  type        = string
}

variable "subnet_cidrs" {
  description = "Subnet cidrs"
  type        = list
}

variable "subnet_azs" {
  description = "Subnet Availability zones"
  type        = list
}


variable "route_table_count" {
  description = "Number of route table to be deployed"
  type        = number
  default     = 2
}
