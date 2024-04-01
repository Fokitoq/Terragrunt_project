output "load_balancer_dns_name" {
  description = "DNS name of the Application Load Balancer"
  value       = aws_lb.ASG_load_balancer.dns_name
}
