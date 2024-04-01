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

# ASG_related vars
min_size = 1
max_size = 3
desired_capacity = 2
}

dependency "vpc" {
  config_path = "../../vpc"
}

dependency "ec2" {
  config_path = "../ec2"
}
