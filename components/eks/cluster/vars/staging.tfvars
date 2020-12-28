environment = "staging"
default_tags = {
    Terraform = "true"
    Environment = "staging"
    TerraformLocation = "modules/eks/cluster/main.tf"
}

aws_provider__region = "eu-central-1"
aws_provider__profile = "apolonio-staging"
aws_availability_zones__names = ["eu-central-1a", "eu-central-1b", "eu-central-1c"]

aws_eks__cluster__name = "la_tarima"
aws_eks__cluster__subnet_ids = []
aws_eks__cluster__kubernetes_version = "1.18"
aws_eks__cluster__public_access_cidrs = ["178.8.68.0/24"]

aws_role__eks_cluster__name = "AWSServiceRoleEksCluster"
