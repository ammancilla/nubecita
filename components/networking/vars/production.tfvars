region = "eu-central-1"

availability_zones = ["eu-central-1a", "eu-central-1b", "eu-central-1c"]

aws_vpc__cidr_block = "10.10.0.0/16"
aws_vpc__location = "components/networking/main.tf"
aws_vpc__name = "nubecita"

aws_subnet__private__location = "components/networking/main.tf"
aws_subnet__private__name = "aws_subnet__private"

aws_subnet__public__location = "components/networking/main.tf"
aws_subnet__public__name = "aws_subnet__public"

aws_route_table__location = "components/networking/main.tf"
aws_route_table__name = "aws_route_table__public"
