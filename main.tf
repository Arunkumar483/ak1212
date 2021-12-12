module "VPC" {
  source = "./modules/vpc"

  cidr         = var.cidr
  vpc_name     = var.vpc_name
  subnet_cidrs = var.subnet_cidrs
  subnet_azs   = var.subnet_azs
}

module "EC2" {
  source = "./modules/ec2"

  instance_name   = var.ec2_instance_name
  key_pair        = var.key_pair
  alb_name        = var.alb_name
  vpc_id          = module.VPC.vpc_id
  file_path       = var.file_path
  web_src = var.web_src
  security_groups = [aws_security_group.akEC2sg.id]
  public_subnets  = slice(module.VPC.subnets, 0, 2)
}
module "RDS" {
  source = "./modules/rds"

  db_identifier   = var.db_identifier
  username        = var.username
  password        = var.password
  dbname          = var.dbname
  security_groups = [aws_security_group.akMYSQLsg.id]
  private_subnets = slice(module.VPC.subnets, 2, 4)
}

resource "null_resource" "ec2-file-copy" {
  connection{
    type = "ssh"
    host = module.EC2.ec2_instances[count.index].public_ip
    user = "ec2-user"
    private_key = file("/home/arun/ak1212/utilities/pemfile.pem")
  }
  count = length(module.EC2.ec2_instances)

  provisioner "file" {
    source=var.web_src
    destination = "/tmp/config.php"
  }
  provisioner "remote-exec" {
    inline=["sudo cp /tmp/config.php /var/www/html/config.php"]
  }
}


