output "id" {
  value = module.eks-node-group.id
}

output "autoscaling_groups" {
  value = module.eks-node-group.autoscaling_groups
}
