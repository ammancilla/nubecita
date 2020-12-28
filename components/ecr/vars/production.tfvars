environment = "production"
default_tags = {
  Terraform = "true"
  Environment = "production"
  TerraformLocation = "components/ecr/main.tf"
}

aws_provider__region = "eu-central-1"
aws_provider__profile = "apolonio-production"

ecr__repos = [
  {
    name = "oferfacil",
    scan_on_push = true,
    image_tag_mutability = "INMUTABLE"
  },
  {
    name = "drilococo",
    scan_on_push = true,
    image_tag_mutability = "INMUTABLE"
  }
]
