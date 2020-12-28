locals {
  name = aws_eks_cluster.tarima.id
  certificate_authority_data = aws_eks_cluster.tarima.certificate_authority[0].data
  kubernetes_endpoint = aws_eks_cluster.tarima.endpoint
  kubernetes_config = <<-EOF
apiVersion: v1
clusters:
- cluster:
    server: ${local.kubernetes_endpoint}
    certificate-authority-data: ${local.certificate_authority_data}
  name: ${local.name}
contexts:
- context:
    cluster: ${local.name}
    user: aws-eks
  name: ${local.name}
current-context: ${local.name}
kind: Config
preferences: {}
users:
- name: aws-eks
  user:
    exec:
      apiVersion: client.authentication.k8s.io/v1alpha1
      command: aws
      args:
        - "eks"
        - "get-token"
        - "--cluster-name"
        - ${local.name}
EOF
}

output "name" {
  value = local.name
}

output "certificate_authority_data" {
  value = local.certificate_authority_data
}

output "security_group_id" {
  value = aws_eks_cluster.tarima.vpc_config[0].cluster_security_group_id
}

output "kubernetes_config" {
  value = local.kubernetes_config
}

output "kubernetes_version" {
  value = aws_eks_cluster.tarima.version
}

output "kubernetes_endpoint" {
  value = local.kubernetes_endpoint
}
