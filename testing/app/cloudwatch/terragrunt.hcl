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
  source = "../../../cloudwatch"
}

# Define variables specific to this environment
inputs = {

  autoscaling_group_name = dependency.autoscaling.outputs.autoscaling_group_name

  env = include.env.locals.env

  # Email to subscribe about scale notifications
  sns_email = ["testing@gmail.com"]
}


dependency "autoscaling" {
  config_path = "../autoscaling"
  mock_outputs = {
    autoscaling_group_name = "temp"
  }
  
}