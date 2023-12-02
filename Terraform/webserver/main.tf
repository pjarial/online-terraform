#webserver
resource "aws_instance" "web" {
  count = length(var.availability_zone)
  subnet_id = var.subnet_id[count.index]
  availability_zone = var.availability_zone[count.index]
  ami = data.aws_ami.ubuntu.id
  instance_type = var.instance_type
  vpc_security_group_ids = [var.security_group_id]
  user_data = <<EOF
  #!/bin/bash
  # install httpd (Linux 2 version)
  yum update -y
  install -y httpd
  systemctl start httpd
  systemctl enable httpd
  echo "<h1>Hello World from $(hostname -f)</h1>" > /var/www/html/index.html
  EOF
  tags = {
    Name = var.web_tags[count.index]
  }
}