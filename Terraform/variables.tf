variable "region" {
  description = "aws region to used for configuration"
  type = string
}

#vpc
variable "vpc_cidr"{
    description = "cidr block range of vpc"
    type = string
}
variable "vpc_tags" {
  description = "tags associated to vpc"
  type = string
}

#subnets
variable "availability_zone" {
  description = "AZ used for creating subnets"
  type = list(string)
}
variable "pusnet_cidr" {
  description = "cidr block range for public subnets"
  type = list(string)
}
variable "prsnet_cidr" {
  description = "cidr block range for private subnets"
  type = list(string)
}
variable "pusnet_tags" {
  description = "tags associated with public subnets"
  type = list(string)
}
variable "prsnet_tags" {
  description = "tags associated with private subnets"
  type = list(string)
}

#igw
variable "igw_tags" {
  description = "tags associated to igw"
  type = string
}

#natgw
variable "eip_tags" {
  description = "tags associated with elastic ip"
  type = string
}
variable "nat_tags" {
  description = "tags associated with nat gw"
  type = string
}

#sg
variable "sg_name" {
  description = "Name of security group craeted for webserver"
  type = string
}
variable "ingress_from_port" {
  description = "sg starting port number for inbound traffic"
  type = string
}
variable "ingress_to_port" {
  description = "sg ending port number for inbound traffic"
  type = string
}
variable "ingress_protocol" {
  description = "protocol for inbound ports"
  type = string
}
variable "egress_from_port" {
  description = "sg starting port number for outbound traffic"
  type = string
}
variable "egress_to_port" {
  description = "sg ending port for outbound traffic"
  type = string
}
variable "egress_protocol" {
  description = "protocol for outbound traffic"
  type = string
}
variable "sg_tags" {
  description = "tags associated with security group"
  type = string
}

#webserver
variable "instance_type" {
  description = "instance type used to launch ec2"
  type = string
}
variable "web_tags" {
  description = "tags associated to webservers"
  type = list(string)
}

#alb
variable "sgalb_name" {
  description = "Name of security group for alb"
  type = string
}
variable "sgalb_tags" {
  description = "tags associated with sg for alb"
  type = string
}
variable "from_port" {
  description = "port number for alb inbound traffic"
  type = string
}
variable "to_port" {
  description = "port number for alb outbound traffic"
  type = string
}
variable "sgprotocol" {
  description = "protocol on which inbound port number work"
  type = string
}
variable "alb_name" {
  description = "Name of application load balancer"
  type = string
}
variable "alb_tags" {
  description = "tags associated with alb"
  type = string
}
variable "port" {
  description = "port number fpor alb listener"
  type = string
}
variable "protocol" {
  description = "protocol for alb listener port"
  type = string
}
variable "alb_tg_name" {
  description = "Name of target group"
  type = string
}
variable "healthy_threshold" {
  description = "Healthy threshold value for alb healthcheck"
  type = number
}
variable "unhealthy_threshold" {
  description = "Unhealthy threshold value for alb healthcheck"
  type = number
}
variable "timeout" {
  description = "healthcheck timeout in seconds"
  type = number
}

#asg
variable "aslc_name" {
  description = "Name of launch configuration"
  type = string
}
variable "asg_name" {
  description = "Name of asg"
  type = string
}
variable "min_size" {
  description = "min size of ec2 launch"
  type = number
}
variable "max_size" {
  description = "max size of ec2 launch"
  type = number
}
variable "health_check_grace_period" {
  description = "healthcheck grace period in seconds"
}