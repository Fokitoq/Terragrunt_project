variable "sns_email" {
  type        = list(string)
  description = "Email used to subscribe to events notifications"
  default     = ["bogdanpetrovich123@gmail.com"]
}

variable "image_id" {
  type        = string
  description = "AMI ID"
  default     = "ami-0c7217cdde317cfec"  
}

variable "instance_type" {
  type        = string
  description = "Instance type"
  default     = "t2.micro"               
}

variable "key_name" {
  type        = string
  description = "Key name"
  default     = "vprofile-prod-key"     
}

variable "min_size" {
  type        = number
  description = "Minimum size for the auto scaling group"
  default     = 2                        
}

variable "max_size" {
  type        = number
  description = "Maximum size for the auto scaling group"
  default     = 5                        
}

variable "desired_capacity" {
  type        = number
  description = "Desired capacity for the auto scaling group"
  default     = 2                        
}

variable "bucket" {
  description = "The name of the S3 bucket where Terraform state will be stored"
  type        = string
  default     = "vprofile-kops-state22"
}

variable "key" {
  description = "The key/path within the bucket where Terraform state will be stored"
  type        = string
  default     = "terraform_dummy/terraform.tfstate"
}

variable "region" {
  description = "The AWS region where the S3 bucket is located"
  type        = string
  default     = "us-east-1"
}



variable "azs" {
 type        = list(string)
 description = "Availability Zones for VPC"
 default     = ["us-east-1a", "us-east-1b"]
}

variable "vpc_cidr_block" {
  type        = string
  description = "CIDR block for the VPC"
  default     = "10.0.0.0/16"  
}

variable "public_subnet_cidrs" {
 type        = list(string)
 description = "Public Subnet CIDR values"
 default     = ["10.0.1.0/24", "10.0.2.0/24"]
}

