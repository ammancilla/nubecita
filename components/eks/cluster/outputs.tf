output "name" {
  value = module.eks-cluster.name
}

output "security_group_id" {
  value = module.eks-cluster.security_group_id
}

output "certificate_authority_data" {
  value = module.eks-cluster.certificate_authority_data
}

output "kubernetes_config" {
  value = module.eks-cluster.kubernetes_config
}

output "kubernetes_version" {
  value = module.eks-cluster.kubernetes_version
}
output "kubernetes_endpoint" {
  value = module.eks-cluster.kubernetes_endpoint
}
