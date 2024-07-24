#Terraform Module for Reusable Infrastructure Components

This Terraform module sets up an ECS Service with an Application Load Balancer (ALB) on AWS, including VPC, subnets, and security group configurations.


## Inputs

| Name                | Description                       | Type           | Default   |
|---------------------|-----------------------------------|----------------|-----------|
| `region`            | AWS region                        | `string`       | `us-east-1` |
| `vpc_name`          | VPC name                           | `string`       | `null`    |
| `vpc_cidr`          | VPC CIDR block                     | `string`       | `null`    |
| `subnet_cidrs`      | List of subnet CIDR blocks         | `list(string)` | `null`    |
| `availability_zones`| List of availability zones         | `list(string)` | `null`    |
| `ecs_cluster_name`  | ECS cluster name                   | `string`       | `null`    |
| `ecs_task_family`   | ECS task family                    | `string`       | `null`    |
| `container_name`    | Container name                     | `string`       | `null`    |
| `container_image`   | Container image                    | `string`       | `null`    |
| `container_memory`  | Container memory (MB)              | `number`       | `512`     |
| `container_cpu`     | Container CPU units                | `number`       | `256`     |
| `ecs_service_name`  | ECS service name                   | `string`       | `null`    |
| `desired_count`     | Number of ECS service instances    | `number`       | `1`       |
| `container_port`    | Container port                     | `number`       | `80`      |

## Outputs

| Name                | Description                        |
|---------------------|------------------------------------|
| `vpc_id`            | ID of the VPC                      |
| `subnet_ids`        | IDs of the subnets                 |
| `ecs_cluster_id`    | ID of the ECS cluster              |
| `ecs_service_id`    | ID of the ECS service              |
| `ecs_service_url`   | URL of the ECS service load balancer |

## Example Usage

```hcl
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


How to Run
Initialize Terraform: Initialize the configuration and download the necessary provider plugins.
terraform init

Validate Configuration: Check the syntax and validity of the configuration.
terraform validate

Plan Deployment: See the execution plan and verify the changes Terraform will make.
terraform plan -out=tfplann

Apply Configuration: Create the resources as defined in the configuration. Confirm the action when prompted.
terraform apply "tfplann"  

Outputs:
ecs_cluster_id = "arn:aws:ecs:us-east-1:339712947033:cluster/my-cluster"
ecs_service_id = "arn:aws:ecs:us-east-1:339712947033:service/my-cluster/my-ecs-service"
ecs_service_url = "my-ecs-service-lb-412218089.us-east-1.elb.amazonaws.com"
subnet_ids = [
  "subnet-0f4c953e7604732a0",
  "subnet-07159f6185e047fb9",
]
vpc_id = "vpc-04f21c70153e98979"

