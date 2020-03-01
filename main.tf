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
  cidr_block = var.cidr_block

  tags = {
    Name = var.aws_vpc_name
    Location = var.aws_vpc_location
    Environment = var.environment
  }
}
