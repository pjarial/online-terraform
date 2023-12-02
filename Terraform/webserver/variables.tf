variable "availability_zone" {
  description = "list of AZs used in configuration"
  type = list(string)
}
variable "subnet_id" {
  description = "List of subnets in which server to be launched"
  type = string
}
variable "instance_type" {
  description = "instance type used to launch ec2"
  type = string
}
variable "security_group_id" {
  description = "security group id to be attached to ec2"
  type = string
}
variable "web_tags" {
  description = "tags associated to webservers"
  type = list(string)
}