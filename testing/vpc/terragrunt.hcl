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
  source = "../../vpc"
}


# Define variables specific to this environment
inputs = {
    # VPC related vars
env = include.env.locals.env
azs = ["us-east-1a", "us-east-1b"]
vpc_cidr_block = "10.30.0.0/16"
public_subnet_cidrs = ["10.30.1.0/24", "10.30.2.0/24"]
}
