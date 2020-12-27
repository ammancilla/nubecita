variable "environment" {}
variable "default_tags" {}

variable "aws_provider__region" {}
variable "aws_provider__profile" {}

variable "aws_availability_zones__names" {}

variable "aws_vpc__name" {}
variable "aws_vpc__cidr_block" {}

variable "aws_subnet__public__name" {}
variable "aws_subnet__private__name" {}
variable "aws_subnet__cidrsubnet__netnum" {}
variable "aws_subnet__cidrsubnet__newbits" {}

variable "aws_route_table__name" {}
variable "aws_network_acl__name" {}
variable "aws_internet_gateway__name" {}
