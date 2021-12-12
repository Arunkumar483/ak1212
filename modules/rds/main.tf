resource "aws_db_instance" "akMySQL" {

  allocated_storage      = 20
  identifier             = var.db_identifier
  engine                 = var.engine
  engine_version         = var.db_version
  instance_class         = var.instance_type
  name                   = var.dbname
  username               = var.username
  password               = length(var.password) >= 8 ? var.password : var.default_password
  port                   = var.port
  db_subnet_group_name   = aws_db_subnet_group.ak-SubGroup.name
  skip_final_snapshot    = true
  vpc_security_group_ids = var.security_groups
}
resource "aws_db_subnet_group" "ak-SubGroup" {
  name       = "${var.db_identifier}-subgroup"
  subnet_ids = var.private_subnets
  tags = {
    Name = "${var.db_identifier}-SubGroup"
  }
}