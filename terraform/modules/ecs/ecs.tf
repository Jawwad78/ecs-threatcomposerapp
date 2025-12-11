#create ecs cluster
resource "aws_ecs_cluster" "ecs" {
  name = "ecs_cluster"
}


# create a logs group
resource "aws_cloudwatch_log_group" "logs" {
  name = "/ecs/threat"
  retention_in_days = var.retention_in_days
  log_group_class = var.log_group_class
}

#create task definition 
resource "aws_ecs_task_definition" "test" {
  network_mode             = "awsvpc"
  family                   = "threatapp"
  requires_compatibilities = ["FARGATE"]
  cpu                      = var.cpu
  memory                   = var.memory
  execution_role_arn = var.execution_role_arn
  container_definitions = jsonencode([
    {
      name      = var.container_name
      image     = var.image_arn
      essential = true
      portMappings = [
        {
          containerPort = var.container_port
          hostPort      = var.hostPort
        }
      ],
      logConfiguration = {
      logDriver= "awslogs",
      options = {
        awslogs-group = "/ecs/threat"
        awslogs-region = var.region
        awslogs-stream-prefix = "ecs/threat"
        awslogs-create-group = "true"
      },
    }
  },
 ])
    runtime_platform {
    operating_system_family = var.operating_system_family
    cpu_architecture        = var.cpu_architecture
  }
}   
    
#create ecs service
resource "aws_ecs_service" "ecs_service" {
  name            = "ecs_service"
  launch_type     = "FARGATE"
  platform_version = "LATEST"
  scheduling_strategy = "REPLICA"
  cluster         = aws_ecs_cluster.ecs.id
  task_definition = aws_ecs_task_definition.test.arn
  desired_count   = var.desired_count
  deployment_minimum_healthy_percent = var.deployment_minimum_healthy_percent
  deployment_maximum_percent = var.deployment_maximum_percent
  depends_on      =  [var.execution_role_arn]

  network_configuration {
   assign_public_ip = var.assign_public_ip
   security_groups = [var.sg_ecs]
   subnets = [var.private_subnet_1_id, var.private_subnet_2_id]
  }

  load_balancer {
    target_group_arn = var.target_group_arn
    container_name   = var.container_name
    container_port   = var.container_port
  }
}
