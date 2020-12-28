#
# -- Node Group • Policy
#
resource "aws_iam_role_policy" "policy__autoscale" {
  name = var.policy__name
  role = aws_iam_role.role__minions.id

  policy = jsonencode(
    {
      Version = "2012-10-17",
      Statement = [
        {
          Effect = "Allow",
          Action = [
            "autoscaling:DescribeAutoScalingGroups",
            "autoscaling:DescribeAutoScalingInstances",
            "autoscaling:DescribeLaunchConfigurations",
            "autoscaling:DescribeTags",
            "autoscaling:SetDesiredCapacity",
            "autoscaling:TerminateInstanceInAutoScalingGroup",
            "ec2:DescribeLaunchTemplateVersions"
          ],
          Resource = "*"
        }
      ]
    }
  )
}

#
# -- Node Group • Role
#
resource "aws_iam_role" "role__minions" {
  name = var.role__name

  assume_role_policy = jsonencode(
    {
      Version = "2012-10-17",
      Statement = [
        {
          Effect = "Allow",
          Action = "sts:AssumeRole",
          Principal = {
            Service = "ec2.amazonaws.com"
          }
        }
      ]
    }
  )

  tags = merge(
    var.default_tags,
    {
      Name = format("%s", var.role__name)
    }
  )
}

resource "aws_iam_role_policy_attachment" "attachment__AmazonEKSWorkerNodePolicy" {
  role       = aws_iam_role.role__minions.name
  policy_arn = "arn:aws:iam::aws:policy/AmazonEKSWorkerNodePolicy"
}

resource "aws_iam_role_policy_attachment" "attachment__AmazonEKS_CNI_Policy" {
  role       = aws_iam_role.role__minions.name
  policy_arn = "arn:aws:iam::aws:policy/AmazonEKS_CNI_Policy"
}

resource "aws_iam_role_policy_attachment" "attachment__AmazonEC2ContainerRegistryReadOnly" {
  role       = aws_iam_role.role__minions.name
  policy_arn = "arn:aws:iam::aws:policy/AmazonEC2ContainerRegistryReadOnly"
}

#
# -- Node Group
#
resource "aws_eks_node_group" "minions" {
  subnet_ids      = var.node_group__subnet_ids
  cluster_name    = var.cluster__name
  node_role_arn   = aws_iam_role.role__minions.arn
  instance_types  = var.node_group__instance_type
  node_group_name = var.node_group__name

  scaling_config {
    desired_size = var.node_group__desired_size
    max_size     = var.node_group__max_size
    min_size     = var.node_group__min_size
  }

  lifecycle {
    ignore_changes = [scaling_config[0].desired_size]
  }

  depends_on = [
    aws_iam_role_policy_attachment.attachment__AmazonEKS_CNI_Policy,
    aws_iam_role_policy_attachment.attachment__AmazonEKSWorkerNodePolicy,
    aws_iam_role_policy_attachment.attachment__AmazonEC2ContainerRegistryReadOnly
  ]

  tags = merge(
    var.default_tags,
    map(
      "Name", format("%s", var.node_group__name),
      "k8s.io/cluster-autoscaler/${var.cluster__name}", "owned",
      "k8s.io/cluster-autoscaler/enabled", "true"
    )
  )
}
