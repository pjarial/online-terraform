#sg for webserver
resource "aws_security_group" "sg" {
  vpc_id = var.vpc_id
  name = var.sg_name
  ingress {
    from_port = var.ingress_from_port
    to_port = var.ingress_to_port
    protocol = var.ingress_protocol
    cidr_blocks = [var.vpc_cidr]
  }
  egress {
    from_port = var.egress_from_port
    to_port = var.egress_to_port
    protocol = var.egress_protocol
    cidr_blocks = [var.vpc_cidr]
  }
  tags = {
    Name = var.sg_tags
  }
}