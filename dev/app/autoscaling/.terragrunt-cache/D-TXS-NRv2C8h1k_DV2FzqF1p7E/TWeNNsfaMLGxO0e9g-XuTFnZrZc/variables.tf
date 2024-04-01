variable "env" {
  type    = string
  default = "undefined-env"
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