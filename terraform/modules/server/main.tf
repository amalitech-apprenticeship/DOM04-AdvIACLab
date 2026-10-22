resource "aws_security_group" "this" {
  vpc_id = var.vpc_id
  name = "secgrp-advlab04"
  description = "Allow HTTP/80 and SSH/22"
}

resource "aws_vpc_security_group_ingress_rule" "allow_http" {
  security_group_id = aws_security_group.this.id
  ip_protocol= tcp
  from_port = 80
  to_port = 80
  cidr_ipv4 = var.cidr_block
}

resource "aws_vpc_security_group_ingress_rule" "allow_ssh" {
  security_group_id = aws_security_group.this.id
  ip_protocol = tcp
  from_port = 22
  to_port = 22
  cidr_ipv4 = var.my_ip
}


resource "aws_instance" "server" {
  subnet_id = var.subnet_id
  vpc_security_group_ids = [ aws_security_group.this.id ]
  instance_type = var.instance_type
  ami = var.ami
  associate_public_ip_address = true
}


