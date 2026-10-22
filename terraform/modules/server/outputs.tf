output "instance_ip" {
  value = aws_instance.server.public_ip
}

output "instance_dns" {
  value = aws_instance.server.public_dns
}