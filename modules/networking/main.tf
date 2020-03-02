#
# NETWORKING
#
# - IG: Internet Gateway
#
# 1. VPC
# 2. Zero or more public subnets (per AZ)
# 3. Zero or more private subnets (per AZ)
# 4. Network ACL (allow all inbound & outbound traffic)
# 5. Private Route Table (Local traffic)
# 5. Public Route Table (Local + IG traffic)
# 7. IG
#

terraform {
  required_providers {
    aws = "~> 2.0"
  }
}

provider "aws" {
  region = var.region
}

resource "aws_vpc" "nubecita" {
  cidr_block = var.aws_vpc_cidr_block

  tags = {
    Environment = var.environment
    Location = var.aws_vpc_location
    Name = var.aws_vpc_name
  }
}

resource "aws_route_table" "private" {
  vpc_id = aws_vpc.nubecita.id

  tags = {
    Environment = var.environment
    Location = var.aws_route_table_location
    Name = var.aws_route_table_name
  }
}

resource "aws_main_route_table_association" "nubecita_a_private" {
  vpc_id         = aws_vpc.nubecita.id
  route_table_id = aws_route_table.private.id
}
