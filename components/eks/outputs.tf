locals {
  kubeconfig = <<-EOF
apiVersion: v1
clusters:
- cluster:
    server: ${module.eks.kubernetes_api_endpoint}
    certificate-authority-data: ${module.eks.cluster_certificate_authority_data}
  name: ${var.aws_eks__cluster__name}
contexts:
- context:
    cluster: ${var.aws_eks__cluster__name}
    user: aws-eks
  name: ${var.aws_eks__cluster__name}
current-context: ${var.aws_eks__cluster__name}
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
        - ${var.aws_eks__cluster__name}
EOF
}

output "kubeconfig" {
  value = local.kubeconfig
}

output "kubernetes_version" {
  value = module.eks.kubernetes_version
}
output "kubernetes_api_endpoint" {
  value = module.eks.kubernetes_api_endpoint
}

output "cluster_security_group_id" {
  value = module.eks.cluster_security_group_id
}

output "cluster_certificate_authority_data" {
  value = module.eks.cluster_certificate_authority_data
}
