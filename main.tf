/*
* main.tf
*/

provider "aws" {
  region = ""
}

module "security-group" {
  source  = "terraform-aws-modules/security-group/aws"
  version = "3.1.0"
  # ID of the VPC where to create security group
  vpc_id = ""
  # Name of security group
  name = ""
}

module "ec2-instance" {
  source  = "terraform-aws-modules/ec2-instance/aws"
  version = "2.8.0"
  # A list of security group IDs to associate with
  vpc_security_group_ids = []
  # ID of AMI to use for the instance
  ami = ""
  # The type of instance to start
  instance_type = ""
  # Name to be used on all resources as prefix
  name = ""
}

module "vpc" {
  source  = "terraform-aws-modules/vpc/aws"
  version = "2.17.0"
  # Assign IPv6 address on intra subnet, must be disabled to change IPv6 CIDRs. This is the IPv6 equivalent of map_public_ip_on_launch
  intra_subnet_assign_ipv6_address_on_creation = false
  # Assign IPv6 address on public subnet, must be disabled to change IPv6 CIDRs. This is the IPv6 equivalent of map_public_ip_on_launch
  public_subnet_assign_ipv6_address_on_creation = false
  # Assign IPv6 address on redshift subnet, must be disabled to change IPv6 CIDRs. This is the IPv6 equivalent of map_public_ip_on_launch
  redshift_subnet_assign_ipv6_address_on_creation = false
  # Should be true to enable ClassicLink DNS Support for the VPC. Only valid in regions and accounts that support EC2 Classic.
  enable_classiclink_dns_support = false
  # Assign IPv6 address on private subnet, must be disabled to change IPv6 CIDRs. This is the IPv6 equivalent of map_public_ip_on_launch
  private_subnet_assign_ipv6_address_on_creation = false
  # Should be true to enable ClassicLink for the VPC. Only valid in regions and accounts that support EC2 Classic.
  enable_classiclink = false
  # Assign IPv6 address on elasticache subnet, must be disabled to change IPv6 CIDRs. This is the IPv6 equivalent of map_public_ip_on_launch
  elasticache_subnet_assign_ipv6_address_on_creation = false
  # Assign IPv6 address on database subnet, must be disabled to change IPv6 CIDRs. This is the IPv6 equivalent of map_public_ip_on_launch
  database_subnet_assign_ipv6_address_on_creation = false
}
