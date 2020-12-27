module "networking" {
  source = "../../modules/networking"

  # Base
  environment = var.environment
  default_tags = var.default_tags

  # AZ
  aws_availability_zones__names = var.aws_availability_zones__names

  # VPC
  aws_vpc__name = var.aws_vpc__name
  aws_vpc__cidr_block = var.aws_vpc__cidr_block

  # Subnets
  aws_subnet__public__name = var.aws_subnet__public__name
  aws_subnet__private__name = var.aws_subnet__private__name
  aws_subnet__cidrsubnet__netnum = var.aws_subnet__cidrsubnet__netnum
  aws_subnet__cidrsubnet__newbits = var.aws_subnet__cidrsubnet__newbits

  # Network ACL
  aws_network_acl__name = var.aws_network_acl__name

  # Route Table
  aws_route_table__name = var.aws_route_table__name

  # Internet Gateway
  aws_internet_gateway__name = var.aws_internet_gateway__name
}
