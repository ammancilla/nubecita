module "eks" {
  source = "../../modules/eks"

  environment = var.environment
  terraform__location = var.terraform__location

  aws_availability_zones__names = var.aws_availability_zones__names

  aws_role__name = var.aws_role__name
}
