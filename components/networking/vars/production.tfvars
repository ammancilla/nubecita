environment = "production"
default_tags = {
    Terraform = "true"
    Environment = "production"
    TerraformLocation = "modules/networking/main.tf"
}

aws_provider__region = "eu-central-1"
aws_provider__profile = "apolonio-production"

aws_availability_zones__names = ["eu-central-1a", "eu-central-1b", "eu-central-1c"]

aws_vpc__name = "nubecita"
aws_vpc__cidr_block = "10.10.0.0/16"

aws_subnet__public__name = "aws_subnet__public"
aws_subnet__private__name = "aws_subnet__private"
aws_subnet__cidrsubnet__netnum = 1
aws_subnet__cidrsubnet__newbits = 8

aws_route_table__name = "aws_route_table__public"
aws_network_acl__name = "aws_network_acl__private"
aws_internet_gateway__name = "aws_internet_gateway"
