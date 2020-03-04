module "networking" {
  source = "../../modules/networking"

  region = var.region
  availability_zones = var.availability_zones
  environment = var.environment

  # VPC
  aws_vpc__cidr_block = var.aws_vpc__cidr_block
  aws_vpc__location = var.aws_vpc__location
  aws_vpc__name = var.aws_vpc__name

  # Subnets
  aws_subnet__cidrsubnet_newbits = var.aws_subnet__cidrsubnet_newbits
  aws_subnet__cidrsubnet__netnum = var.aws_subnet__cidrsubnet__netnum

  # -= private
  aws_subnet__private__name = var.aws_subnet__private__name
  aws_subnet__private__location = var.aws_subnet__private__location

  # -- public
  aws_subnet__public__name = var.aws_subnet__public__name
  aws_subnet__public__location = var.aws_subnet__public__location
}
