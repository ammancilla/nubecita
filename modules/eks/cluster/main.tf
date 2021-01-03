#
# -- Cluster Role --
#
resource "aws_iam_role" "cluster__role"  {
  name = var.cluster__role__name

  assume_role_policy = jsonencode(
    {
      Version = "2012-10-17",
      Statement = [
        {
          Effect = "Allow",
          Principal = {
            Service = "eks.amazonaws.com"
          },
          Action = "sts:AssumeRole"
        }
      ]
    }
  )

  tags = merge(
    var.default_tags,
    {
      Name = format("%s", var.cluster__role__name)
    }
  )
}

resource "aws_iam_role_policy_attachment" "attachment__AmazonEKSClusterPolicy" {
  role = aws_iam_role.cluster__role.name
  policy_arn = "arn:aws:iam::aws:policy/AmazonEKSClusterPolicy"
}

#
# -- Cluster --
#
resource "aws_eks_cluster" "tarima" {
  name = var.cluster__name
  role_arn = aws_iam_role.cluster__role.arn
  version = var.cluster__kubernetes_version

  vpc_config {
    subnet_ids = var.cluster__subnet_ids

    endpoint_public_access  = true
    endpoint_private_access = true
    public_access_cidrs = var.cluster__public_access_cidrs
  }

  depends_on = [
    aws_iam_role_policy_attachment.attachment__AmazonEKSClusterPolicy
  ]

  tags = merge(
    var.default_tags,
    {
      Name = format("%s", var.cluster__name)
    }
  )
}
