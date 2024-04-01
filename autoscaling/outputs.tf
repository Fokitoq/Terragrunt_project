output "autoscaling_group_name" {
  description = "Name of the Auto Scaling group"
  value       = aws_autoscaling_group.Docker_ASG.name
}

output "lb_target_group_arn" {
  description = "Target group arn"
  value       = aws_lb_target_group.ASG_target_group.arn
}
