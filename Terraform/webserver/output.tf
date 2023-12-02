output "webservers" {
  value = aws_instance.web[*].id
}