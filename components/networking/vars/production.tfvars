environment = "production"
default_tags = {
    Terraform = "true"
    Environment = "production"
    TerraformLocation = "modules/networking/main.tf"
}

provider__region = "eu-central-1"
provider__profile = "apolonio-production"

availability_zones__names = ["eu-central-1a", "eu-central-1b", "eu-central-1c"]

vpc__name = "nubecita"
vpc__cidr_block = "10.10.0.0/16"
vpc__enable_dns_hostnames = true

subnet__public__name = "subnet__public"
subnet__private__name = "subnet__private"
subnet__cidrsubnet__netnum = 1
subnet__cidrsubnet__newbits = 8

ig__name = "internet_gateway"
route_table__name = "route_table__public"
network_acl__name = "network_acl__private"
