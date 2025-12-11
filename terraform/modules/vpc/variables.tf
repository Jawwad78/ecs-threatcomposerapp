variable "cidr_block_vpc" {
 type = string
  description = "VPC cidr block"
}

variable "cidr_block_public_1" {
 type = string
  description = "public subnet 1"
}

variable "cidr_block_public_2" {
 type = string
  description = "public subnet 2"
}

variable "cidr_block_private_1" {
 type = string
  description = "private subnet 1"
}

variable "cidr_block_private_2" {
 type = string
  description = "private subnet 2"
}


#availibity zones 
variable "availability_zone_1" {
    type = string
    description = "1st az location "
}

variable "availability_zone_2" {
    type = string
    description = "2nd az location "
}

variable "port_80" {
  type = number
  description = "port for http that we use"
}

variable "port_443" {
  type = number
  description = "port for https that we use"
}

variable "tcp" {
  type = string
  description = "tcp"
}

variable "cidr_ipv4" {
  type = string
  description = "ipv4 cidr"
}



variable "ecs_sg_ports" {
  type = number
  description = "ecs inbound and outbound ports"
}


