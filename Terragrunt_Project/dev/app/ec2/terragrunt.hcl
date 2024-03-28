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
        # Launch template vars
image_id = "ami-0c7217cdde317cfec"
instance_type = "t2.micro"
key_name = "vprofile-prod-key"
}

