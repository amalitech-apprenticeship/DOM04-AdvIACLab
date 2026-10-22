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
  instance_type = "t3.micro"
  vpc_id = module.network.vpc_id
  cidr_block = var.cidr_block
}