output "pusnet" {
  value = aws_subnet.pusnet[*].id
}
output "prsnet" {
  value = aws_subnet.prsnet[*].id
}