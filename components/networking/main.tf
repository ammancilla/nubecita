module "networking" {
  source = "../../modules/networking"

  aws_vpc_cidr_block = var.aws_vpc_cidr_block
  aws_vpc_location = var.aws_vpc_location
  aws_vpc_name = var.aws_vpc_name
  environment = var.environment
  region = var.region
}
