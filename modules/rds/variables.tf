variable "private_subnets" {
  description = "public subnets for ec2 instances"
  type        = list(any)
}

variable "security_groups" {
  description = "security groups for ec2 instances"
  type        = list(any)
}

variable "db_identifier" {
  description = "name of db server to be created"
  type        = string
}
variable "engine" {
  description = "engine type of db to be created"
  type        = string
  default     = "mysql"
}


variable "db_version" {
  description = "version of db server to be created"
  default     = "8.0.23"
}


variable "instance_type" {
  description = "instance class of db"
  type        = string
  default     = "db.t3.micro"
}

variable "dbname" {
  description = "name of db to be created inside the server"
  type        = string
}
variable "username" {
  description = "username of the db server"
  type        = string
}

variable "password" {
  description = "password of the db server (should be 8 characters)"
  type        = string
}

variable "default_password" {
  description = "default password of the db server (should be 8 characters)"
  type        = string
  default     = "arunkumar"
}

variable "port" {
  description = "port of the db server to be exposed"
  type        = string
  default     = "3306"
}