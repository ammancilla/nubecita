module "networking" {
  source = "../../modules/networking"

  environment = var.environment
  region = var.region

  # VPC
  aws_vpc__cidr_block = var.aws_vpc__cidr_block
  aws_vpc__location = var.aws_vpc__location
  aws_vpc__name = var.aws_vpc__name

  # Private Subnets
  availability_zones = var.availability_zones
  aws_subnet__private__name = var.aws_subnet__private__name
  aws_subnet__private__count = var.aws_subnet__private__count
  aws_subnet__private__location = var.aws_subnet__private__location
}
