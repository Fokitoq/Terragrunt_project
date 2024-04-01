output "ASG_launch_config" {
  description = "lauch configuration name"
  value       = aws_launch_configuration.ASG_launch_config.name
}