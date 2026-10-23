output "instance_ip" {
  value = module.server.instance_ip
}
output "instance_dns" {
  value = module.server.instance_dns
}
output "ssh_user" {
  value = "ec2-user"
}

output "key_name" {
  value = aws_key_pair.deployer_lab4.key_name
}

output "key_path" {
  value = "~/.ssh/deployer_lab4.pub"
}