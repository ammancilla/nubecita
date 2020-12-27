output "kubernetes_version" {
  value = aws_eks_cluster.tarima.version
}

output "kubernetes_api_endpoint" {
  value = aws_eks_cluster.tarima.endpoint
}

output "cluster_security_group_id" {
  value = aws_eks_cluster.tarima.vpc_config[0].cluster_security_group_id
}

output "cluster_certificate_authority_data" {
  value = aws_eks_cluster.tarima.certificate_authority[0].data
}
