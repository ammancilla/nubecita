output "id" {
  value = aws_eks_node_group.minions.id
}

output "autoscaling_groups" {
  value = aws_eks_node_group.minions.resources[0].autoscaling_groups
}
