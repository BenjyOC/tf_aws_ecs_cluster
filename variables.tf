variable "region" {
        description = "Region identifier (Ex: eu-west-1)"
}

variable "customer" {
        description = "Customer name"
}

variable "project" {
        description = "Name for ec2 instance"
}

variable "iam_instance_profile" {
        description = "The IAM Instance Profile (Ex: Name=AmazonECSContainerInstanceRole)"
}

variable "environment_name" {
    description = "Environment name"
}

variable "availability_zones" {
        type = "list"
        description = "Comma separated list of EC2 availability zones to launch instances, must be within region"
}

variable "key_name" {
        description = "SSH key name in your AWS account for AWS instances."
}

variable "cluster_name" {
        description = "The name for ECS Cluster"
}

variable "security_group_ids" {
        type = "list"
        description = "Security Group attached to EC2 instances"
}

variable "load_balancers" {
        type = "list"
        description = "ELB Name"
}
variable "user_data" {}

variable "role" {
        default = "web"
}

variable "id" {
        default = "1"
}

variable "instance_type" {
        default = "t2.large"
        description = "Name of the AWS instance type"
}

variable "ecs_ami" {
        default = "ami-a7f2acc1"
        description = "AMI id to launch, default is Amazon Linux ECS optimized"
}

variable "vol_docker_type" {
        default = "gp2"
}

variable "vol_root_type" {
        default = "gp2"
}

variable "vol_root_size" {
        default = "100"
}

variable "vol_docker_size" {
        default = "300"
}

variable "asg_min_size" {
        default = "2"
        description = "Minimum number of instances to run in the group"
}

variable "asg_max_size" {
        default = "2"
        description = "Maximum number of instances to run in the group"
}


variable "termination_policies" {
        default = "OldestLaunchConfiguration"
}
