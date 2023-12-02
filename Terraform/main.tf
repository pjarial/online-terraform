#vpc
module "vpc" {
  source = "./vpc"
  vpc_cidr = var.vpc_cidr
  vpc_tags = var.vpc_tags
}

#subnets
module "subnets" {
  source = "./subnets"
  vpc_id = module.vpc.vpc
  availability_zone = var.availability_zone
  pusnet_cidr = var.pusnet_cidr
  pusnet_tags = var.pusnet_tags
  prsnet_cidr = var.prsnet_cidr
  prsnet_tags = var.prsnet_tags
}

#igw
module "igw" {
  source = "./igw"
  vpc_id = module.vpc.vpc
  igw_tags = var.igw_tags
}

#natgw
module "natgw" {
  source = "./natgw"
  subnet_id = module.subnets.pusnet[0]
  eip_tags = var.eip_tags
  nat_tags = var.nat_tags
}

#sg
module "sg" {
  source = "./sg"
  vpc_id = module.vpc.vpc
  sg_name = var.sg_name
  ingress_from_port = var.ingress_from_port
  ingress_to_port = var.ingress_to_port
  ingress_protocol = var.ingress_protocol
  egress_from_port = var.egress_from_port
  egress_to_port = var.egress_to_port
  egress_protocol = var.egress_protocol
  vpc_cidr = var.vpc_cidr
  sg_tags = var.sg_tags
}

#webserver
module "webserver" {
  source = "./webserver"
  availability_zone = var.availability_zone
  security_group_id = module.sg.sg
  subnet_id = module.subnets.prsnet
  instance_type = var.instance_type
  web_tags = var.web_tags
}

#alb
module "alb" {
  source = "./alb"
  vpc_id = module.vpc.vpc
  sgalb_name = var.sgalb_name
  sgalb_tags = var.sgalb_tags
  from_port = var.from_port
  to_port = var.to_port
  sgprotocol = var.sgprotocol
  alb_name = var.alb_name
  subnets = module.subnets.pusnet
  alb_tags = var.alb_tags
  port = var.port
  protocol = var.protocol
  alb_tg_name = var.alb_tg_name
  availability_zone = var.availability_zone
  healthy_threshold = var.healthy_threshold
  unhealthy_threshold = var.unhealthy_threshold
  timeout = var.timeout
  target_id = module.webserver.webservers
}

#asg
module "asg" {
  source = "./asg"
  aslc_name = var.aslc_name
  instance_type = var.instance_type
  security_group_id = module.sg.sg
  asg_name = var.asg_name
  subnet_id = module.subnets.prsnet
  min_size = var.min_size
  max_size = var.max_size
  health_check_grace_period = var.health_check_grace_period
}