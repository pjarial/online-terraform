variable "vpc_id" {
  description = "vpc in which alb need to be created"
  type = string
}
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
variable "subnets" {
  description = "subnets in which alb to be attached"
  type = list(string)
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
variable "availability_zone" {
  description = "list of AZs used in configuration"
  type = list(string)
}
variable "target_id" {
  description = "target ids for the alb"
  type = list(string)
}