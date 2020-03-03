variable "environment" {
  description = "The working environment"
}

variable "region" {
  description = "AWS region"
}

variable "availability_zones" {
  type = list
  description = "List of AZ of the AWS region"
}

variable "aws_vpc__name" {}
variable "aws_vpc__location" {
  description = "Location of the .tf file that defines the VPC"
}
variable "aws_vpc__cidr_block" {
  description = "VPC's cidr block"
}

variable "aws_subnet__private__name" {}
variable "aws_subnet__private__count" {}
variable "aws_subnet__private__location" {}
