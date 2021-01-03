module "eks-cluster" {
  source = "../../../modules/eks/cluster"

  environment = var.environment
  default_tags = var.default_tags
  availability_zones__names = var.availability_zones__names

  cluster__name = var.cluster__name
  cluster__subnet_ids = concat(
    data.terraform_remote_state.networking.outputs.private_subnet_ids,
    data.terraform_remote_state.networking.outputs.public_subnet_ids
  )
  cluster__kubernetes_version = var.cluster__kubernetes_version
  cluster__public_access_cidrs = var.cluster__public_access_cidrs

  cluster__role__name = var.cluster__role__name
}
