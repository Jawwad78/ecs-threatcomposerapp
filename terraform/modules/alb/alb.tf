#create a application load balancer
resource "aws_lb" "alb" {
  name               = "alb"
  internal           = var.internal #we want it internet facing, so we'll keep it false
  load_balancer_type = var.load_balancer_type
  security_groups    = [var.sg_alb]
  subnets            = [var.public_subnet_1_id, var.public_subnet_2_id]

  enable_deletion_protection = false #to save deleting the ALB, change to false if ALB needs deleting

  tags = {
    name = "alb"
  }
}

#create target group so alb can target the  target group
resource "aws_lb_target_group" "ip_example" {
  name        = "albthreat"
  port        = var.port_80
  protocol    = var.alb_protocol
  vpc_id      = var.vpc_id
  target_type = var.target_type
 
  health_check {
    path = var.health_check_path
  }
}

#create an ALB listener
resource "aws_lb_listener" "alb_listener" {
  load_balancer_arn = aws_lb.alb.arn
  port              = var.port_443
  protocol          = var.alb_protocol_listener
  ssl_policy        = var.ssl_policy
  certificate_arn   = var.acm_certificate_arn

  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.ip_example.arn
  }
}