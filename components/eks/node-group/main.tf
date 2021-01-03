module "eks-node-group" {
  source = "../../../modules/eks/node-group"

  environment = var.environment
  default_tags = var.default_tags

  role__name = var.role__name
  policy__name = var.policy__name
  cluster__name = data.terraform_remote_state.eks-cluster.outputs.name

  node_group__name = var.node_group__name
  node_group__min_size = var.node_group__min_size
  node_group__max_size = var.node_group__max_size
  node_group__subnet_ids = data.terraform_remote_state.networking.outputs.public_subnet_ids
  node_group__desired_size = var.node_group__desired_size
  node_group__instance_type = var.node_group__instance_type
}
