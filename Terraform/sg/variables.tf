variable "vpc_id" {
  description = "vpc id in which seciruti group to be created"
  type = string
}
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
variable "vpc_cidr" {
  description = "vpc cidr block range to allow traffic to security group"
  type = string
}
variable "sg_tags" {
  description = "tags associated with security group"
  type = string
}