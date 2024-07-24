provider "aws" {
  region = "us-east-1"
}

module "ecs_service" {
  source              = "./terraform-ecs"
  region              = "us-east-1"
  vpc_name            = "my-vpc"
  vpc_cidr            = "10.0.0.0/16"
  subnet_cidrs        = ["10.0.1.0/24", "10.0.2.0/24"]
  availability_zones  = ["us-east-1a", "us-east-1b"]
  ecs_cluster_name    = "my-cluster"
  ecs_task_family     = "my-task-family"
  container_name      = "my-container"
  container_image     = "nginx"
  container_memory    = 512
  container_cpu       = 256
  ecs_service_name    = "my-ecs-service"
  desired_count       = 1
  container_port      = 80
}

output "vpc_id" {
  value = module.ecs_service.vpc_id
}

output "subnet_ids" {
  value = module.ecs_service.subnet_ids
}

output "ecs_cluster_id" {
  value = module.ecs_service.ecs_cluster_id
}

output "ecs_service_id" {
  value = module.ecs_service.ecs_service_id
}

output "ecs_service_url" {
  value = module.ecs_service.ecs_service_url
}
