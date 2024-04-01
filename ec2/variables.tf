variable "env" {
  type    = string
  default = "undefined-env"
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


