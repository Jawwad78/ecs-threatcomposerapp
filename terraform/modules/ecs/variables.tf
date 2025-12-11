variable "image_arn" {
  type = string
  description = "container image arn"
}


variable "cpu" {
    type = string
    description = "cpu for container"
}

variable "memory" {
  type = string
  description = "memory for container"
}


variable "operating_system_family" {
  type = string
  description = "operating system"
}

variable "cpu_architecture" {
  type = string
  description = "cpu architecture"
}

variable "retention_in_days" {
  type = number
  description = "how long to retain log events"
}

variable "log_group_class" {
  type = string
  description = "log class"
}

variable "region" {
  type = string
  description = "region"
}

variable "desired_count" {
  type = number
  description = "how many tasks we need"
}

variable "deployment_minimum_healthy_percent" {
  type = number
  description = "any new configs we do to task definition, our new task must start first before removing old one "
}

variable "deployment_maximum_percent" {
  type = number
  description = "how many new tasks we want if we change our task definition "
}

variable "assign_public_ip" {
  type = string
  description = "public ip to task eni, since my tasks are in private subnet,it will be false"
}

variable "private_subnet_1_id" {
  type = string
  description = "ID of private subnet 1"  
}

variable "private_subnet_2_id" {
  type = string
  description = "ID of private subnet 2"  
}

variable "sg_ecs" {
  type = string
  description = "ID of ecs security group"
}

variable "target_group_arn" {
  type = string
  description = "alb target group's ARN"
}

variable "container_name" {
  type = string
  description = "container name"
}

variable "container_port" {
  type = number
  description = "container port"
}

variable "hostPort" {
  type = number
  description = "host container port"
}

variable "execution_role_arn" {
  type = string
  description = "execution role arn"
}