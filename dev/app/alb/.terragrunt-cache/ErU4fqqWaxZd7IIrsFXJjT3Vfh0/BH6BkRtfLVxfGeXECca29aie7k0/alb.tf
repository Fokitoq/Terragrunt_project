variable "sg_alb" {}
variable "subnet_ids" {}
variable "autoscaling_group_name" {}
variable "lb_target_group_arn" {}

# Elastic load balancer creation
resource "aws_lb" "ASG_load_balancer" {
  name               = "ASG-ELB-${var.env}"
  internal           = false
  load_balancer_type = "application"
  security_groups    = [var.sg_alb]
  subnets            = var.subnet_ids
  tags = {
    Name = "ASG_Docker_ELBSG_${var.env}"
  }
}

# Configure listeners for the ELB, forward traffic to target group
resource "aws_lb_listener" "http_listener" {
  load_balancer_arn = aws_lb.ASG_load_balancer.arn
  port              = 80
  protocol          = "HTTP"

  default_action {
    type             = "forward"
    target_group_arn = var.lb_target_group_arn
  }
}
