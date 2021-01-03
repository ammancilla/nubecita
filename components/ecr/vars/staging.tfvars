environment = "staging"
default_tags = {
  Terraform = "true"
  Environment = "staging"
  TerraformLocation = "components/ecr/main.tf"
}

aws_provider__region = "eu-central-1"
aws_provider__profile = "apolonio-staging"

ecr__repos = [
  {
    name = "myapp",
    scan_on_push = true,
    image_tag_mutability = "IMMUTABLE"
  },
  {
    name = "drilococo",
    scan_on_push = true,
    image_tag_mutability = "IMMUTABLE"
  }
]
