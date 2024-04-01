variable "env" {
  type    = string
  default = "undefined-env"
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


