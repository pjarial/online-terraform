variable "availability_zone" {
  description = "AZ used for creating subnets"
  type = list(string)
}
variable "vpc_id" {
  description = "vpc id where the subnet to be associated"
  type = string
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