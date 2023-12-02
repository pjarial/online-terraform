variable "eip_tags" {
  description = "tags associated with elastic ip"
  type = string
}
variable "subnet_id" {
  description = "public subnet id in which nat gw to be created"
  type = string
}
variable "nat_tags" {
  description = "tags associated with nat gw"
  type = string
}