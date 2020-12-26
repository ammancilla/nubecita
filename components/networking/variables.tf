variable "environment" {}
variable "aws_region__name" {}
variable "aws_profile__name" {}
variable "aws_availability_zones__names" {
  default = ["eu-central-1a", "eu-central-1b", "eu-central-1c"]
}
variable "aws_subnet__cidrsubnet_newbits" {
  default = 8
}
variable "aws_subnet__cidrsubnet__netnum" {
  default = 1
}

variable "aws_vpc__cidr_block" {}
variable "aws_vpc__name" {}
variable "aws_vpc__location" {}
variable "aws_route_table__name" {}
variable "aws_route_table__location" {}
variable "aws_subnet__private__name" {}
variable "aws_subnet__private__location" {}
variable "aws_subnet__public__name" {}
variable "aws_subnet__public__location" {}
variable "aws_internet_gateway__name" {}
variable "aws_internet_gateway__location" {}
variable "aws_network_acl__location" {}
variable "aws_network_acl__name" {}
