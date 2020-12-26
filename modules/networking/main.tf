
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
# -- VPC ---
#
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
  count = length(var.aws_availability_zones__names)

  vpc_id = aws_vpc.nubecita.id
  availability_zone = var.aws_availability_zones__names[count.index]
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
  count = length(var.aws_availability_zones__names)

  vpc_id = aws_vpc.nubecita.id
  availability_zone = var.aws_availability_zones__names[count.index]
  cidr_block = cidrsubnet(
    aws_vpc.nubecita.cidr_block,
    var.aws_subnet__cidrsubnet_newbits,
    length(var.aws_availability_zones__names) + count.index + 1
  )

  tags = {
    Count = count.index
    Environment = var.environment
    Location = var.aws_subnet__public__location
    Name = "${var.aws_subnet__public__name}.${count.index}"
    Tier = "public"
  }
}

#
# Network ACL
#
resource "aws_network_acl" "private" {
  vpc_id = aws_vpc.nubecita.id
  subnet_ids = data.aws_subnet_ids.private.ids

  egress {
    protocol   = -1
    rule_no    = 100
    action     = "allow"
    cidr_block = aws_vpc.nubecita.cidr_block
    from_port  = 0
    to_port    = 0
  }

  ingress {
    protocol   = -1
    rule_no    = 100
    action     = "allow"
    cidr_block = aws_vpc.nubecita.cidr_block
    from_port  = 0
    to_port    = 0
  }

  tags = {
    Environment = var.environment
    Location = var.aws_network_acl__location
    Name = var.aws_network_acl__name
    Tier = "private"
  }
}

data "aws_subnet_ids" "private" {
  vpc_id = aws_vpc.nubecita.id

  tags = {
    Tier = "private"
  }
}

#
# Route Table
#
resource "aws_route_table" "public" {
  vpc_id = aws_vpc.nubecita.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.igw.id
  }

  tags = {
    Environment = var.environment
    Location = var.aws_route_table__location
    Name = var.aws_route_table__name
    Tier = "public"
  }
}

data "aws_subnet_ids" "public" {
  vpc_id = aws_vpc.nubecita.id

  tags = {
    Tier = "public"
  }
}

resource "aws_route_table_association" "subnet_public__assoc__route_table_public" {
  for_each = data.aws_subnet_ids.public.ids
  subnet_id = each.value
  route_table_id = aws_route_table.public.id
}

#
# Internet Gateway
#
resource "aws_internet_gateway" "igw" {
  vpc_id = aws_vpc.nubecita.id

  tags = {
    Environment = var.environment
    Location = var.aws_internet_gateway__location
    Name = var.aws_internet_gateway__name
  }
}
