module "networking" {
  source = "../../modules/networking"

  environment = var.environment
  region = var.region

  # VPC
  aws_vpc_cidr_block = var.aws_vpc_cidr_block
  aws_vpc_location = var.aws_vpc_location
  aws_vpc_name = var.aws_vpc_name

  # Route Table · Private
  aws_route_table_name = var.aws_route_table_name
  aws_route_table_location = var.aws_route_table_location
}
