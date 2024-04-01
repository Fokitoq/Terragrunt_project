

module "vpc" {
  source = "./vpc"
}



module "ec2" {
  source = "./ec2"
  instance_sg_id = module.sg.instance_sg_id
}

module "cloudwatch" {
  source = "./cloudwatch"
  autoscaling_group_name = module.autoscaling.autoscaling_group_name
}

module "autoscaling" {
  source = "./autoscaling"
  vpc_id      = module.vpc.vpc_id
  subnet_ids   = module.vpc.subnet_ids
  ASG_launch_config = module.ec2.ASG_launch_config
}


module "alb" {
  source = "./alb"

sg_alb       = module.sg.elb_sg_id
subnet_ids   = module.vpc.subnet_ids
autoscaling_group_name = module.autoscaling.autoscaling_group_name
lb_target_group_arn = module.autoscaling.lb_target_group_arn

}

module "sg" {
  source = "./sg"

vpc_id      = module.vpc.vpc_id

}


output "alb_dns_name_output" {
  value = module.alb.load_balancer_dns_name
}