variable "cidr_block_vpc" {
  type        = string
  description = "VPC cidr block"
}

variable "cidr_block_public_1" {
  type        = string
  description = "public subnet 1"
}

variable "cidr_block_public_2" {
  type        = string
  description = "public subnet 2"
}

variable "cidr_block_private_1" {
  type        = string
  description = "private subnet 1"
}

variable "cidr_block_private_2" {
  type        = string
  description = "private subnet 2"
}


variable "availability_zone_1" {
  type        = string
  description = "1st az location "
}

variable "availability_zone_2" {
  type        = string
  description = "2nd az location "
}

variable "cpu" {
  type        = string
  description = "cpu for container"
}

variable "memory" {
  type        = string
  description = "memory for container"
}

variable "image_arn" {
  type        = string
  description = "container image arn"
}

variable "operating_system_family" {
  type        = string
  description = "operating system"
}

variable "cpu_architecture" {
  type        = string
  description = "cpu architecture"
}

variable "retention_in_days" {
  type        = number
  description = "how long to retain log events"
}

variable "log_group_class" {
  type        = string
  description = "log class"
}

variable "region" {
  type        = string
  description = "region"
}

variable "desired_count" {
  type        = number
  description = "how many tasks we need"
}

variable "deployment_minimum_healthy_percent" {
  type        = number
  description = "any new configs we do to task definition, our new task must start first before removing old one "
}

variable "deployment_maximum_percent" {
  type        = number
  description = "how many new tasks we want if we change our task definition "
}

variable "assign_public_ip" {
  type        = string
  description = "public ip to task eni, since my tasks are in private subnet,it will be false"
}

variable "port_80" {
  type        = number
  description = "port for http that we use"
}

variable "port_443" {
  type        = number
  description = "port for https that we use"
}

variable "ecs_sg_ports_1" {
  type        = number
  description = "port inbound ecs to alb"
}

variable "tcp" {
  type        = string
  description = "tcp"
}


variable "ecs_sg_ports" {
  type        = number
  description = "ecs inbound and outbound ports"
}


variable "cidr_ipv4" {
  type        = string
  description = "ipv4 cidr"
}


variable "internal" {
  type        = string
  description = "is alb internal"
}

variable "load_balancer_type" {
  type        = string
  description = "alb load balancer"
}

variable "alb_protocol" {
  type        = string
  description = "http protocol for alb"
}

variable "alb_protocol_listener" {
  type        = string
  description = "https protocol for alb"
}

variable "ssl_policy" {
  type        = string
  description = "the ssl policy"
}


variable "target_type" {
  type        = string
  description = "ip address target"
}

variable "container_name" {
  type        = string
  description = "container name"
}

variable "container_port" {
  type        = number
  description = "container port"
}

variable "hostPort" {
  type        = number
  description = "host container port"
}

variable "domain_name" {
  type        = string
  description = "my domain name "
}

variable "validation_method" {
  type        = string
  description = "validation method "
}

variable "acm_tag" {
  type        = string
  description = "my acm cert tag"
}

variable "key_algorithm" {
  type        = string
  description = "acm key algorithm"
}


variable "health_check_path" {
  type        = string
  description = "health check path"
}