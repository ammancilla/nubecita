module "eks-cluster" {
  source = "../../../modules/eks/cluster"

  environment = var.environment
  default_tags = var.default_tags

  aws_availability_zones__names = var.aws_availability_zones__names

  aws_eks__cluster__name = var.aws_eks__cluster__name
  aws_eks__cluster__subnet_ids = concat(
    data.terraform_remote_state.networking.outputs.private_subnet_ids,
    data.terraform_remote_state.networking.outputs.public_subnet_ids
  )
  aws_eks__cluster__kubernetes_version = var.aws_eks__cluster__kubernetes_version
  aws_eks__cluster__public_access_cidrs = var.aws_eks__cluster__public_access_cidrs

  aws_role__eks_cluster__name = var.aws_role__eks_cluster__name
}
