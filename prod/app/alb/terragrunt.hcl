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
  elb_sg_id = dependency.sg.outputs.elb_sg_id
  subnet_ids = dependency.vpc.outputs.subnet_ids
  vpc_id = dependency.vpc.outputs.vpc_id
}



dependency "vpc" {
  config_path = "../../vpc"
  mock_outputs = {
    subnet_ids = ["temp"]
    vpc_id = "temp"
  }
}

dependency "sg" {
  config_path = "../sg"
  mock_outputs = {
   elb_sg_id = "temp"
  }
}

#dependency "autoscaling" {
 # config_path = "../autoscaling"
 # mock_outputs = {
 #   autoscaling_group_name = "temp"
 # }
#}



