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

#
# -- VPC ---
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
  cidr_block = var.aws_vpc__cidr_block

  tags = {
    Environment = var.environment
    Location = var.aws_vpc__location
    Name = var.aws_vpc__name
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

#
# -- Subnets ---
#
# AWS will associate them to the
# main route table automatically
#
resource "aws_subnet" "private" {
  count = length(var.availability_zones)

  vpc_id = aws_vpc.nubecita.id
  availability_zone = var.availability_zones[count.index]
  cidr_block = cidrsubnet(
    aws_vpc.nubecita.cidr_block,
    var.aws_subnet__cidrsubnet_newbits,
    var.aws_subnet__cidrsubnet__netnum + count.index
  )

  tags = {
    Count = count.index
    Environment = var.environment
    Location = var.aws_subnet__private__location
    Name = "${var.aws_subnet__private__name}.${count.index}"
    Tier = "private"
  }
}

resource "aws_subnet" "public" {
  count = length(var.availability_zones)

  vpc_id = aws_vpc.nubecita.id
  availability_zone = var.availability_zones[count.index]
  cidr_block = cidrsubnet(
    aws_vpc.nubecita.cidr_block,
    var.aws_subnet__cidrsubnet_newbits,
    length(var.availability_zones) + count.index + 1
  )

  tags = {
    Count = count.index
    Environment = var.environment
    Location = var.aws_subnet__public__location
    Name = "${var.aws_subnet__public__name}.${count.index}"
    Tier = "public"
  }
}
