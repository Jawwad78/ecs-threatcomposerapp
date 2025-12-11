output "public_subnet_1" {
 description = "public subnets"
 value =  aws_subnet.public_subnet_1.id
}

output "public_subnet_2" {
 description = "public subnets"
 value =  aws_subnet.public_subnet_2.id
}

output "private_subnet_1" {
 description = "private subnet 1"
 value =  aws_subnet.private_subnet_1.id
}

output "private_subnet_2" {
 description = "private subnet 2"
 value =  aws_subnet.private_subnet_2.id
}

output "sg_alb" {
    description = "alb security group id"
    value = aws_security_group.alb.id
}

output "sg_ecs" {
    description = "ecs security group id"
    value = aws_security_group.ecs.id
}

output "vpc_id" {
  description = "the VPC'S id"
  value = aws_vpc.ecs_vpc.id
  }
