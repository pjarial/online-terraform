#security group for alb
resource "aws_security_group" "sgalb" {
  vpc_id = var.vpc_id
  name = var.sgalb_name
  tags = {
    Name = var.sgalb_tags
  }
}

resource "aws_security_group_rule" "sgalb-rule1" {
  security_group_id = aws_security_group.sgalb.id
  type = "ingress"
  from_port = var.from_port
  to_port = var.to_port
  protocol = var.sgprotocol
  cidr_blocks = ["0.0.0.0/0"]
}

#alb
resource "aws_lb" "awslb" {
  name = var.alb_name
  internal = false
  load_balancer_type = "application"
  security_groups = [aws_security_group.sgalb.id]
  subnets = var.subnets
  tags = {
    Name = var.alb_tags
  }
}

#listener
resource "aws_lb_listener" "ls" {
  load_balancer_arn = aws_lb.awslb.arn
  port = var.port
  protocol = var.protocol
  default_action {
    type = "forward"
    target_group_arn = aws_lb_target_group.tg.arn
  }
}

#target group
resource "aws_lb_target_group" "tg" {
  name = var.alb_tg_name
  port = var.port
  protocol = var.protocol
  vpc_id = var.vpc_id
  health_check {
    healthy_threshold = var.healthy_threshold
    unhealthy_threshold = var.unhealthy_threshold
    timeout = var.timeout
    path = "/"
  }
}

#target group attachment
resource "aws_lb_target_group_attachment" "tg-a" {
  count = length(var.availability_zone)
  target_group_arn = aws_lb_target_group.tg.arn
  port = var.port
  target_id = var.target_id[count.index]
}