provider "aws" {
  region                   = "eu-central-1"
  shared_credentials_files = ["/home/ubuntu/.aws/credentials"]
}
module "key_pair" {
  source = "terraform-aws-modules/key-pair/aws"

  key_name           = "staking-test"
  create_private_key = true
}

module "vpc" {
  source = "terraform-aws-modules/vpc/aws"

  name = "staking-vpc"
  cidr = "10.10.0.0/16"

  azs = ["eu-central-1a"]
  #  private_subnets = ["10.10.0.0/16"]
  public_subnets = ["10.10.0.0/16"]

  create_igw = true

  enable_dns_hostnames = true
  enable_dns_support   = true


  tags = {
    Environment = "staking"
  }
}

module "ssh_service_sg" {
  source  = "terraform-aws-modules/security-group/aws//modules/ssh"
  version = "~> 5.0"

  name        = "allow_ssh"
  description = "Allow SSH inbound traffic"
  vpc_id      = module.vpc.vpc_id

  ingress_cidr_blocks = ["0.0.0.0/0"]
}

module "ec2_instance" {
  source = "terraform-aws-modules/ec2-instance/aws"

  for_each = toset(["1", "2"])

  name = "polkadot-fullnode-${each.key}"

  ami                         = "ami-04e601abe3e1a910f"
  instance_type               = "c6i.4xlarge"
  key_name                    = module.key_pair.key_pair_name
  monitoring                  = true
  vpc_security_group_ids      = [module.ssh_service_sg.security_group_id]
  associate_public_ip_address = true
  subnet_id                   = module.vpc.public_subnets[0]

  tags = {
    Environment = "staking"
  }
}

