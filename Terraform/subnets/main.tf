#public subnet
resource "aws_subnet" "pusnet" {
  count = length(var.availability_zone)
  vpc_id = var.vpc_id
  availability_zone = var.availability_zone[count.index]
  cidr_block = var.pusnet_cidr[count.index]
  tags = {
    Name = var.pusnet_tags[count.index]
  }
}

#private subnet
resource "aws_subnet" "prsnet" {
  count = length(var.availability_zone)
  vpc_id = var.vpc_id
  availability_zone = var.availability_zone[count.index]
  cidr_block = var.prsnet_cidr[count.index]
  tags = {
    Name = var.prsnet_tags[count.index]
  }
}