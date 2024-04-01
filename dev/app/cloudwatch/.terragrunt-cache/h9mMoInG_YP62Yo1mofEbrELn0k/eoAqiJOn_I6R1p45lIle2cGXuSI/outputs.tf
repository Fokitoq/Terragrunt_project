output "cpu_alarm_arn_up" {
  description = "ARN of the CloudWatch CPU alarm for scaling up"
  value       = aws_cloudwatch_metric_alarm.web_cpu_alarm_up.arn
}

output "cpu_alarm_arn_down" {
  description = "ARN of the CloudWatch CPU alarm for scaling down"
  value       = aws_cloudwatch_metric_alarm.web_cpu_alarm_down.arn
}

output "autoscaling_event_alarm_arn" {
  description = "ARN of the CloudWatch alarm for autoscaling events"
  value       = aws_cloudwatch_metric_alarm.autoscaling_event_alarm.arn
}
