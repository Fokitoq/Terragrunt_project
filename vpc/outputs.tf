output "vpc_id" {
  description = "The ID of the VPC"
  value       = aws_vpc.ASG_Docker_vpc.id
}


output "internet_gateway_id" {
  description = "The ID of the internet gateway attached to the VPC"
  value       = aws_internet_gateway.ASG_Docker_IG.id
}


output "subnet_ids" {
  description = "List of subnet IDs created in the VPC"
  value = local.subnet_ids
  
}

