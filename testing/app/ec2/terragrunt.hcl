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
  source = "../../../ec2"
}

# Define variables specific to this environment
inputs = {

env = include.env.locals.env
instance_sg_id = dependency.sg.outputs.instance_sg_id

        # Launch template vars
image_id = "ami-0c7217cdde317cfec"
instance_type = "t2.micro"
key_name = "vprofile-prod-key"

}


dependency "sg" {
  config_path = "../sg"
  mock_outputs = {
    instance_sg_id = "temp"
  }
}
