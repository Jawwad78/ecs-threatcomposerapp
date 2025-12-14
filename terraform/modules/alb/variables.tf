variable "internal" {
  type = string
  description = "is alb internal"
}

variable "load_balancer_type" {
  type = string
  description = "alb load balancer"
}

variable "sg_alb" {
  type = string
  description = "alb's security group id"
}

variable "public_subnet_1_id" {
  type = string
  description = "ID of public subnet 1"  
}

variable "public_subnet_2_id" {
  type = string
  description = "ID of public subnet 2"  
}

variable "cidr_block_private_1" {
 type = string
  description = "private subnet 1"
}

variable "cidr_block_private_2" {
 type = string
  description = "private subnet 2"
}


variable "port_80" {
  type = number
  description = "port for http that we use"
}

variable "port_443" {
  type = number
  description = "port for https that we use"
}

variable "alb_protocol" {
  type = string
  description = "http protocol for alb"
}

variable "alb_protocol_listener" {
  type = string
  description = "https protocol for alb"
}

variable "ssl_policy" {
  type = string
  description = "the ssl policy to set up https"
}


variable "health_check_path" {
  type = string
  description = "health check path"
}

variable "target_type" {
  type = string
  description = "ip address target"
}

variable "vpc_id" {
  type = string
  description = "VPC's id"
}

variable "acm_certificate_arn" {
  type = string
  description = "acm certificate arn"
}