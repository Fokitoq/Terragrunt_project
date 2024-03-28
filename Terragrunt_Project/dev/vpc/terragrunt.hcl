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
    # VPC related vars
azs = ["us-east-1a", "us-east-1b"]
vpc_cidr_block = "10.10.0.0/16"
public_subnet_cidrs = ["10.10.1.0/24", "10.10.2.0/24"]
}
