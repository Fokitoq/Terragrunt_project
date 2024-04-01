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
  source = "../../../alb"
}


# Define variables specific to this environment
inputs = {
  env = include.env.locals.env

sg_alb = dependency.sg.outputs.elb_sg_id
subnet_ids = dependency.vpc.outputs.subnet_ids
autoscaling_group_name = dependency.autoscaling.outputs.autoscaling_group_name
lb_target_group_arn = dependency.autoscaling.outputs.lb_target_group_arn

}


dependency "vpc" {
  config_path = "../../vpc"
}

dependency "sg" {
  config_path = "../sg"
}

dependency "autoscaling" {
  config_path = "../autoscaling"
}