output "vpc_id" {
  description = "The ID of the VPC."
  value       = aws_vpc.main.id
}

output "subnet_ids" {
  description = "The IDs of the subnets."
  value       = aws_subnet.subnet[*].id
}

output "ecs_cluster_id" {
  description = "The ID of the ECS cluster."
  value       = aws_ecs_cluster.main.id
}

output "ecs_service_id" {
  description = "The ID of the ECS service."
  value       = aws_ecs_service.main.id
}

output "ecs_service_url" {
  description = "The URL of the ECS service load balancer."
  value       = aws_lb.main.dns_name
}
