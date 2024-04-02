variable "elb_sg_id" {}
variable "subnet_ids" {
  type = list(string)
}
variable "vpc_id" {}


# Elastic load balancer creation
resource "aws_lb" "ASG_load_balancer" {
  name               = "ASG-ELB-${var.env}"
  internal           = false
  load_balancer_type = "application"
  security_groups    = [var.elb_sg_id]
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
    target_group_arn = aws_lb_target_group.ASG_target_group.arn
  }
}


# Target group definition
resource "aws_lb_target_group" "ASG_target_group" {
  name        = "ASG-target-group-${var.env}"
  port        = 3000
  protocol    = "HTTP"
  vpc_id      = var.vpc_id

  health_check {
    path                = "/"
    protocol            = "HTTP"
    timeout             = 5
    interval            = 10
    healthy_threshold   = 2
    unhealthy_threshold = 2
    matcher             = "200-299"
  }
}
