module "networking" {
  source = "../../modules/networking"

  aws_vpc_location = var.aws_vpc_location
  aws_vpc_name = var.aws_vpc_name
  cidr_block = var.cidr_block
  environment = var.environment
  region = var.region
}
