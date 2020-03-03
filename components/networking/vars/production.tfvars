region = "eu-central-1"

availability_zones = ["eu-central-1a", "eu-central-1b", "eu-central-1c"]

aws_vpc_cidr_block = "10.0.0.0/16"
aws_vpc_location = "components/networking/main.tf"
aws_vpc_name = "nubecita"

aws_subnet__private__count = 3
aws_subnet__private__location = "components/networking/main.tf"
aws_subnet__private__name = "aws_subnet__private"
