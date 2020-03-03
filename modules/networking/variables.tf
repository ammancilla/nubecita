variable "environment" {
  description = "The working environment"
}

variable "region" {
  description = "AWS region"
}

variable "aws_vpc_cidr_block" {
  description = "VPC's cidr block"
}

variable "aws_vpc_name" {}

variable "aws_vpc_location" {
  description = "Location of the .tf file that defines the vpc"
}
