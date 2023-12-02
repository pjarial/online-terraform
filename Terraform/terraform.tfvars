region = "us-west-2"

#vpc
vpc_cidr = "10.0.0.0/16"
vpc_tags = "Main-Vpc"

#subnets
availability_zone = [ "us-west-2a","us-west-2b" ]
pusnet_cidr = [ "10.0.1.0/24","10.0.2.0/24" ]
prsnet_cidr = [ "10.0.3.0.24","10.0.4.0/24" ]
pusnet_tags = [ "pubsubnet1","pubsubnet2" ]
prsnet_tags = [ "prsubnet1","prsubnet2" ]

#igw
igw_tags = "Main-igw"

#sg
sg_name = "web-security-group"
ingress_from_port = "22"
ingress_to_port = "22"
ingress_protocol = "tcp"
egress_from_port = "0"
egress_to_port = "0"
egress_protocol = "-1"
sg_tags = "Main-Sg"

#webserver
instance_type = "t2.micro"
web_tags = [ "webserver1","webserver2" ]