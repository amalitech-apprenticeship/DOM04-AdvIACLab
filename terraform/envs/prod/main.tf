resource "aws_key_pair" "deployer_lab4" {
  key_name   = var.key_name
  public_key = file("~/.ssh/deployer_lab4.pub")
}

module "network" {
  source = "../../modules/network"
  cidr_block = var.cidr_block
  region = var.region
}

module "server" {
  source = "../../modules/server"
  ami = var.ami
  subnet_id = module.network.subnet_id
  my_ip = var.my_ip
  instance_type = "t2.micro"
  vpc_id = module.network.vpc_id
  cidr_block = var.cidr_block
  key_name = aws_key_pair.deployer_lab4.key_name
}