output "load_balancer_dns_name" {
  description = "DNS name of the Application Load Balancer"
  value       = aws_lb.ASG_load_balancer.dns_name
}

output "lb_target_group_arn" {
  description = "Target group arn"
  value       = aws_lb_target_group.ASG_target_group.arn
}
