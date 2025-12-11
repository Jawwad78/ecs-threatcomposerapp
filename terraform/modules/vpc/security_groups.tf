#creating sg for alb
resource "aws_security_group" "alb" {
  name        = "alb_sg"
  vpc_id      = aws_vpc.ecs_vpc.id

  tags = {
    Name = "alb_sg"
  }
}

resource "aws_vpc_security_group_ingress_rule" "alb_inbound_1" {
  security_group_id = aws_security_group.alb.id
  cidr_ipv4         = var.cidr_ipv4
  from_port         = var.port_80
  ip_protocol       = var.tcp
  to_port           = var.port_80
}

resource "aws_vpc_security_group_ingress_rule" "alb_inbound_2" {
  security_group_id = aws_security_group.alb.id
  cidr_ipv4         = var.cidr_ipv4 
  from_port         = var.port_443
  ip_protocol       = var.tcp
  to_port           = var.port_443
}

resource "aws_vpc_security_group_egress_rule" "alb_outbound"{
  security_group_id = aws_security_group.alb.id
  referenced_security_group_id = aws_security_group.ecs.id
  ip_protocol = var.tcp
  from_port = var.port_80
  to_port = var.port_80
}

resource "aws_vpc_security_group_egress_rule" "alb_outbound_1"{
  security_group_id = aws_security_group.alb.id
  referenced_security_group_id = aws_security_group.ecs.id
  ip_protocol = var.tcp
  from_port = "3000"
  to_port = "3000"
}

#creating sg for ecs 
resource "aws_security_group" "ecs" {
  name        = "sg_ecs"
  vpc_id      = aws_vpc.ecs_vpc.id

  tags = {
    Name = "sg_ecs"
  }
}

resource "aws_vpc_security_group_ingress_rule" "inbound_ecs" {
  security_group_id = aws_security_group.ecs.id
  referenced_security_group_id = aws_security_group.alb.id
  ip_protocol = var.tcp
  from_port = var.ecs_sg_ports
  to_port = var.ecs_sg_ports
}
  resource "aws_vpc_security_group_ingress_rule" "inbound_ecs_1" {
  security_group_id = aws_security_group.ecs.id
  referenced_security_group_id = aws_security_group.alb.id
  ip_protocol = var.tcp
  from_port = "3000"
  to_port = "3000"
}


resource "aws_vpc_security_group_egress_rule" "outbound_ecs" {
  security_group_id = aws_security_group.ecs.id
  cidr_ipv4         = var.cidr_ipv4 
  ip_protocol = var.tcp
  from_port = var.port_443
  to_port = var.port_443
}

