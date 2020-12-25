module "networking" {
  source = "../../modules/networking"

  # Base
  region = var.region
  profile = var.profile
  environment = var.environment
  availability_zones = var.availability_zones

  # VPC
  aws_vpc__cidr_block = var.aws_vpc__cidr_block
  aws_vpc__location = var.aws_vpc__location
  aws_vpc__name = var.aws_vpc__name

  # Subnets
  aws_subnet__cidrsubnet_newbits = var.aws_subnet__cidrsubnet_newbits
  aws_subnet__cidrsubnet__netnum = var.aws_subnet__cidrsubnet__netnum

  # -- private
  aws_subnet__private__name = var.aws_subnet__private__name
  aws_subnet__private__location = var.aws_subnet__private__location

  # -- public
  aws_subnet__public__name = var.aws_subnet__public__name
  aws_subnet__public__location = var.aws_subnet__public__location

  # Network ACL
  aws_network_acl__location = var.aws_network_acl__location
  aws_network_acl__name = var.aws_network_acl__name

  # Route Table
  aws_route_table__name = var.aws_route_table__name
  aws_route_table__location = var.aws_route_table__location

  # Internet Gateway
  aws_internet_gateway__name = var.aws_internet_gateway__name
  aws_internet_gateway__location = var.aws_internet_gateway__location
}
