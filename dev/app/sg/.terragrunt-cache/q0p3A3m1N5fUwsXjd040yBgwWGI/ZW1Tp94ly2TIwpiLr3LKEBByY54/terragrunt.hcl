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
  source = "../../../sg"
}



# Define variables specific to this environment
inputs = {
env = include.env.locals.env
vpc_id = dependency.vpc.outputs.vpc_id

}

dependency "vpc" {
  config_path = "../../vpc"
}