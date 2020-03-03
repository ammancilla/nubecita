#
# NETWORKING
#
# After applying this module you'll have:
#
# 1. VPC
# 2. Zero+ subnets · Public· Per AZ
# 3. Zero+ subnets · Private · Per AZ
# 4. Network ACL · Allow all IN/OUT
# 5. Route Table · Private · Main
# 6. Route Table · Public
# 7. Internet Gateway
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

#
# After creating a VPC, AWS will create,
# automatically, the next resources:
#
# 1. Route Table · Main · Private
# 2. Network ACL · Default · Allow all IN/OUT
#
# TODO: Add tags to the resources mentioned above.
#
