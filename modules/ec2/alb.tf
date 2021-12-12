# apploadbalancer,targergroup->vpn,targetgroupattachtoinstance,alblistener
resource "aws_lb" "akalb" {
  name               = var.alb_name
  internal           = false
  load_balancer_type = "application"
  security_groups    = var.security_groups
  subnets            = var.public_subnets

  enable_deletion_protection = false

  tags = {
    Name       = var.alb_name
    environment = "training"
  }
}

resource "aws_lb_target_group" "akTF-TG" {
  name        = "akTF-TG"
  port        = 80
  protocol    = "HTTP"
  target_type = "instance"
  vpc_id      = var.vpc_id

}

resource "aws_lb_target_group_attachment" "akTGA1" {
  target_group_arn = aws_lb_target_group.akTF-TG.arn
  target_id        = aws_instance.akinstances[count.index].id
  port             = 80
  count            = length(aws_instance.akinstances)
}


resource "aws_lb_listener" "akALBListener" {
  load_balancer_arn = aws_lb.akalb.arn
  port              = "80"
  protocol          = "HTTP"

  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.akTF-TG.arn
  }
}