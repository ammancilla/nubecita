#
# REFERENCES:
# - EKS
# • https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/eks_cluster
# • https://aws.amazon.com/getting-started/hands-on/deploy-kubernetes-app-amazon-eks/
#
# - Role
# • https://docs.aws.amazon.com/IAM/latest/UserGuide/id.html
# • https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_role
# • https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/iam_role
#

#
# Prerequisites:
# • AWS CLI
# • Kubectl
#
# • VPC
# • Cluster IAM Role
#
# NOTE: When an Amazon EKS cluster is created, the IAM entity (user or role) that creates the cluster is added to the Kubernetes RBAC authorization table as the administrator (with system:masters permissions). Initially, only that IAM user can make calls to the Kubernetes API server using kubectl . For more information, see Managing users or IAM roles for your cluster.
#
resource "aws_iam_role" "eks_cluster"  {
  name = var.aws_role__name

  assume_role_policy = <<-EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Effect": "Allow",
      "Principal": {
        "Service": "eks.amazonaws.com"
      },
      "Action": "sts:AssumeRole"
    }
  ]
}
EOF

  tags = {
    Environment = var.environment
    Location = var.terraform__location
    Name = var.aws_role__name
  }
}

resource "aws_iam_role_policy_attachment" "aws_attach__policy__eks_cluster___role__eks_cluster" {
  role = aws_iam_role.eks_cluster.name
  policy_arn = "arn:aws:iam::aws:policy/AmazonEKSClusterPolicy"
}
