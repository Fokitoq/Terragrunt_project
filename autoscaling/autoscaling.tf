variable "vpc_id" {}
variable "subnet_ids" {
  type = list(string)
}
variable "ASG_launch_config" {}
variable "lb_target_group_arn" {}

# Auto scaling group definition
resource "aws_autoscaling_group" "Docker_ASG" {
  name                      = "Docker_ASG${var.env}"
  vpc_zone_identifier       = var.subnet_ids.*
  launch_configuration      = var.ASG_launch_config
  min_size                  = var.min_size
  max_size                  = var.max_size
  desired_capacity          = var.desired_capacity
  health_check_grace_period = 300
  health_check_type         = "EC2"
  target_group_arns         = [var.lb_target_group_arn]

  enabled_metrics = [
    "GroupMinSize",
    "GroupMaxSize",
    "GroupDesiredCapacity",
    "GroupInServiceInstances",
    "GroupTotalInstances"
    ]

  metrics_granularity = "1Minute"

  tag {
    key                 = "Name"
    value               = "ASG_Docker_EC2_${var.env}" #name for EC2 instances created by ASG
    propagate_at_launch = true
  }

}





# Attach target group to your auto-scaling group
resource "aws_autoscaling_attachment" "asg_attachment" {
  autoscaling_group_name = aws_autoscaling_group.Docker_ASG.name
  lb_target_group_arn  = var.lb_target_group_arn
}