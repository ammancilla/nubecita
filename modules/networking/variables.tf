variable "environment" {
  type = string
  description = "The working environment"
}

variable "region" {
  type = string
  description = "AWS region"
}

variable "aws_vpc_cidr_block" {
  type = string
  description = "VPC's cidr block"
}

variable "aws_vpc_name" {
  type = string
}

variable "aws_vpc_location" {
  type = string
  description = "Location of the .tf file that defines the resource"
}
