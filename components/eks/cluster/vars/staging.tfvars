environment = "staging"
default_tags = {
    Terraform = "true"
    Environment = "staging"
    TerraformLocation = "modules/eks/cluster/main.tf"
}

provider__region = "eu-central-1"
provider__profile = "apolonio-staging"
availability_zones__names = ["eu-central-1a", "eu-central-1b", "eu-central-1c"]

cluster__name = "la_tarima"
cluster__role__name = "AWSServiceRoleEksCluster"
cluster__subnet_ids = []
cluster__kubernetes_version = "1.18"
cluster__public_access_cidrs = ["0.0.0.0/0"]

