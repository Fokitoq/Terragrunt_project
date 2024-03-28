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
  # Email to subscribe about scale notifications
  sns_email = ["testemdddddail@gmail.com"]
}