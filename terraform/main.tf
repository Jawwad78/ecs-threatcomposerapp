module "vpc" {
  source = "./modules/vpc"

  cidr_block_vpc       = var.cidr_block_vpc
  cidr_block_public_1  = var.cidr_block_public_1
  cidr_block_public_2  = var.cidr_block_public_2
  cidr_block_private_1 = var.cidr_block_private_1
  cidr_block_private_2 = var.cidr_block_private_2
  availability_zone_1  = var.availability_zone_1
  availability_zone_2  = var.availability_zone_2
  port_80              = var.port_80
  port_443             = var.port_443
  tcp                  = var.tcp
  cidr_ipv4            = var.cidr_ipv4
  ecs_sg_ports         = var.ecs_sg_ports
  ecs_sg_ports_1       = var.ecs_sg_ports_1
}

module "ecs" {
  source = "./modules/ecs"

  cpu                                = var.cpu
  memory                             = var.memory
  image_arn                          = var.image_arn
  operating_system_family            = var.operating_system_family
  cpu_architecture                   = var.cpu_architecture
  retention_in_days                  = var.retention_in_days
  log_group_class                    = var.log_group_class
  region                             = var.region
  desired_count                      = var.desired_count
  deployment_maximum_percent         = var.deployment_maximum_percent
  deployment_minimum_healthy_percent = var.deployment_minimum_healthy_percent
  assign_public_ip                   = var.assign_public_ip
  private_subnet_1_id                = module.vpc.private_subnet_1
  private_subnet_2_id                = module.vpc.private_subnet_2
  sg_ecs                             = module.vpc.sg_ecs
  target_group_arn                   = module.alb.target_group_arn
  container_name                     = var.container_name
  container_port                     = var.container_port
  hostPort                           = var.hostPort
  execution_role_arn                 = module.iam.execution_role_arn

}

module "alb" {
  source = "./modules/alb"

  internal              = var.internal
  load_balancer_type    = var.load_balancer_type
  public_subnet_1_id    = module.vpc.public_subnet_1
  public_subnet_2_id    = module.vpc.public_subnet_2
  sg_alb                = module.vpc.sg_alb
  port_80               = var.port_80
  alb_protocol          = var.alb_protocol
  alb_protocol_listener = var.alb_protocol_listener
  ssl_policy            = var.ssl_policy
  vpc_id                = module.vpc.vpc_id
  target_type           = var.target_type
  port_443              = var.port_443
  cidr_block_private_1  = var.cidr_block_private_1
  cidr_block_private_2  = var.cidr_block_private_2
  health_check_path     = var.health_check_path
  acm_certificate_arn   = module.acm.acm_certificate_arn
}


module "acm" {
  source            = "./modules/acm"
  acm_tag           = var.acm_tag
  key_algorithm     = var.key_algorithm
  domain_name       = var.domain_name
  validation_method = var.validation_method
}

module "iam" {
  source = "./modules/iam"
}