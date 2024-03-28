# Include variables from the root terraform.tfvars and override them if needed
include {
  path = find_in_parent_folders()
}

# Configure Terraform backend settings
terraform {
  source = "../../../ASG_module"
}

# Define variables specific to this environment
inputs = {

# ASG_related vars
min_size = 1
max_size = 3
desired_capacity = 2
}

