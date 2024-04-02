# Include variables from the root terraform.tfvars and override them if needed
include {
  path = find_in_parent_folders()
}

include "env" {
  path           = find_in_parent_folders("env.hcl")
  expose         = true
  merge_strategy = "no_merge"
}

# Configure Terraform backend settings
terraform {
  source = "../../../autoscaling"
}

# Define variables specific to this environment
inputs = {

env = include.env.locals.env

vpc_id = dependency.vpc.outputs.vpc_id
subnet_ids = dependency.vpc.outputs.subnet_ids
ASG_launch_config = dependency.ec2.outputs.ASG_launch_config
lb_target_group_arn = dependency.alb.outputs.lb_target_group_arn

# ASG_related vars
min_size = 2
max_size = 5
desired_capacity = 3
}

dependency "vpc" {
  config_path = "../../vpc"
  mock_outputs = {
    vpc_id = "temp"
    subnet_ids = ["temp"]
  }
}

dependency "ec2" {
  config_path = "../ec2"
  mock_outputs = {
    ASG_launch_config = "temp"
  }
}


dependency "alb" {
  config_path = "../alb"
  mock_outputs = {
    lb_target_group_arn = "mock-lb-target-group-arn"
  }
}