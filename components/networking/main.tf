module "networking" {
  source = "../../modules/networking"

  environment = var.environment
  region = var.region

  # VPC
  aws_vpc_cidr_block = var.aws_vpc_cidr_block
  aws_vpc_location = var.aws_vpc_location
  aws_vpc_name = var.aws_vpc_name

  # Private Subnets
  availability_zones = var.availability_zones
  aws_subnet__private__name = var.aws_subnet__private__name
  aws_subnet__private__count = var.aws_subnet__private__count
  aws_subnet__private__location = var.aws_subnet__private__location
}
