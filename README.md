# tf_aws_ecs_cluster

A Terraform module to create an Amazon ECS Cluster using an Autoscaling Group in AWS.

This module creates an Autoscaling Group with his launch configuration and an ECS Cluster

Module Input Variables
----------------------

 - `customer`                : customer's name
 - `project`                 : project's name
 - `environment`             : Environment name : production, staging, devel, ...
 - `region`                  : Region AWS
 - `availability_zones`      : List of Subnet ID where EC2 are launched by Launch Configuration
 - `security_group_ids`      : List of Security Group Subnet ID where EC2 are launched by Launch Configuration
 - `user_data`               : User data use by EC2 at launch
 - `load_balancers`          : Load balancers to associate to the autoscaling group
