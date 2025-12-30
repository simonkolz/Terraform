module "vpc" {
  source = "./modules/vpc"
  vpc_cidr              = var.vpc_cidr
  pub_cidrs             = var.pub_cidrs
  privatecidrs          = var.privatecidrs
  public_subnet         = var.public_subnet
  private_subnet        = var.private_subnet
  az                    = var.az

}

module "security_group" {
  source = "./modules/security_group"
  vpc_id = module.vpc.vpc_id
  my_ip  = var.my_ip

}

module "ec2" {
  source           = "./modules/ec2"
  ami_id           = var.ami_id
  instance_type    = var.instance_type
  public_subnet_id = module.vpc.public_subnet_ids
  web_sg_id        = module.security_group.web_sg_id
  key_name         = var.key_name
}