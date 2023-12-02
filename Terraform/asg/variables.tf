variable "aslc_name" {
  description = "Name of launch configuration"
  type = string
}
variable "instance_type" {
  description = "instance type for new launch"
  type = string
}
variable "security_group_id" {
  description = "security group assigned to new configuration"
  type = string
}
variable "asg_name" {
  description = "Name of asg"
  type = string
}
variable "subnet_id" {
  description = "subnet id for the asg group"
  type = list(string)
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
