#launch config
resource "aws_launch_configuration" "aslc" {
  name = var.aslc_name
  image_id = data.aws_ami.ubuntu.id
  instance_type = var.instance_type
  security_groups = [var.security_group_id]
}

#asg
resource "aws_autoscaling_group" "asg" {
  name = var.asg_name
  vpc_zone_identifier = var.subnet_id
  launch_configuration = aws_launch_configuration.aslc.name
  min_size = var.min_size
  max_size = var.max_size
  health_check_grace_period = var.health_check_grace_period
  health_check_type = "EC2"
  tag {
    key = "Name"
    value = "launched through autoscaling"
    propagate_at_launch = true
  }
}