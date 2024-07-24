variable "region" {
  description = "The AWS region in which to create the resources."
  type        = string
  default     = "us-east-1"
}

variable "vpc_name" {
  description = "The name of the VPC."
  type        = string
}

variable "vpc_cidr" {
  description = "The CIDR block for the VPC."
  type        = string
}

variable "subnet_cidrs" {
  description = "A list of CIDR blocks for the subnets."
  type        = list(string)
}

variable "availability_zones" {
  description = "A list of availability zones for the subnets."
  type        = list(string)
}

variable "ecs_cluster_name" {
  description = "The name of the ECS cluster."
  type        = string
}

variable "ecs_task_family" {
  description = "The family of the ECS task."
  type        = string
}

variable "container_name" {
  description = "The name of the container."
  type        = string
}

variable "container_image" {
  description = "The container image for the ECS service."
  type        = string
}

variable "container_memory" {
  description = "The amount of memory to allocate to the container."
  type        = number
}

variable "container_cpu" {
  description = "The amount of CPU to allocate to the container."
  type        = number
}

variable "ecs_service_name" {
  description = "The name of the ECS service."
  type        = string
}

variable "desired_count" {
  description = "The desired number of ECS service instances."
  type        = number
  default     = 1
}

variable "container_port" {
  description = "The port on which the container is listening."
  type        = number
}
