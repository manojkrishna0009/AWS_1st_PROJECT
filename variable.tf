variable "vpc_count" {
  type        = number
  description = "Number of VPCs to create"
  default     = 3
}

variable "vpc_names" {
  type        = list(string)
  description = "Names of the VPCs to create"
  default     = ["vpc1", "vpc2", "vpc3"]
}

variable "vpc_cidr_blocks" {
  type        = list(string)
  description = "CIDR blocks for each VPC"
  default     = ["10.0.0.0/16", "10.1.0.0/16", "10.2.0.0/16"]
}
variable "vpc3_cidr_block" {
  type = string
  default = "10.2.0.0/16"
}
variable "vpc2_cidr_block" {
  type = string
  default = "10.1.0.0/16"
}

variable "subnet_cidr_suffixes" {
  type = list(string)
  default = [
    "1",
    "2"
  ]
}

variable "availability_zones" {
  default = ["us-east-1a", "us-east-1b", "us-east-1c"]
}
variable "db_subnet_group_name" {
  default = "subnet_group"
  
}
variable "ecs_task_execution_role_name" {
  description = "ECS task execution role name"
  default = "myEcsTaskExecutionRole"
}

variable "ecs_auto_scale_role_name" {
  description = "ECS auto scale role Name"
  default = "myEcsAutoScaleRole"
}

variable "az_count" {
  description = "Number of AZs to cover in a given region"
  default     = "2"
}

variable "app_image" {
  description = "Docker image to run in the ECS cluster"
  default     = "bradfordhamilton/crystal_blockchain:latest"
}

variable "app_port" {
  description = "Port exposed by the docker image to redirect traffic to"
  default     = 3000
}

variable "app_count" {
  description = "Number of docker containers to run"
  default     = 3
}

variable "health_check_path" {
  default = "/"
}

variable "fargate_cpu" {
  description = "Fargate instance CPU units to provision (1 vCPU = 1024 CPU units)"
  default     = "1024"
}

variable "fargate_memory" {
  description = "Fargate instance memory to provision (in MiB)"
  default     = "2048"
}

variable "sub_count" {
  description = "Fargate instance memory to provision (in MiB)"
  type = list(string)
  default     = ["3","4"]
}
