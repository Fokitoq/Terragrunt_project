output "elb_sg_id" {
  description = "The ID of the security group for the Elastic Load Balancer"
  value       = aws_security_group.elb_sg.id
}

output "instance_sg_id" {
  description = "The ID of the security group for EC2 instances"
  value       = aws_security_group.instance_sg.id
}