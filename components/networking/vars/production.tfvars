environment = "production"

aws_region__name = "eu-central-1"
aws_profile__name = "apolonio-production"

aws_vpc__name = "nubecita"
aws_vpc__cidr_block = "10.10.0.0/16"
aws_vpc__location = "components/networking/main.tf"

aws_subnet__private__name = "aws_subnet__private"
aws_subnet__private__location = "components/networking/main.tf"

aws_subnet__public__name = "aws_subnet__public"
aws_subnet__public__location = "components/networking/main.tf"

aws_route_table__name = "aws_route_table__public"
aws_route_table__location = "components/networking/main.tf"

aws_internet_gateway__name = "aws_internet_gateway"
aws_internet_gateway__location = "components/networking/main.tf"

aws_network_acl__name = "aws_network_acl__private"
aws_network_acl__location = "components/networking/main.tf"
