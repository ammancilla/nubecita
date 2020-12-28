environment = "staging"
default_tags = {
    Terraform = "true"
    Environment = "staging"
    TerraformLocation = "modules/eks/node-group/main.tf"
}

aws_provider__region = "eu-central-1"
aws_provider__profile = "apolonio-staging"

role__name = "AWSServiceRoleEksNodeGroup"
policy__name = "AllowEksNodeGroupAutoscaling"
cluster__name = "autoset_via_terraform_remote_state"

node_group__name = "minions"
node_group__min_size = 1
node_group__max_size = 1
node_group__subnet_ids = []
node_group__desired_size = 1
node_group__instance_type = ["t3.micro"]
