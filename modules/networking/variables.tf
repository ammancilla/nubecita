variable "environment" {
  description = "The working environment"
  type = string
}

variable "default_tags" {
  description = "A map of tags to add to all resources"
  type        = map(string)
  default     = {}
}

variable "aws_availability_zones__names" {
  type = list(string)
  description = "List of AZ of the AWS region"
}

variable "aws_subnet__cidrsubnet__newbits" {
  description = <<-EOT
  Used to calculate the subnet CIDR using terraform's cidrsubnet(prefix, newbits, netnum) function.

  It is the number of additional bits with which to extend the prefix. For example,
  if given a prefix ending in /16 and a newbits value of 4, the resulting subnet address will have length /20."
  EOT
}

variable "aws_subnet__cidrsubnet__netnum" {
  description = <<-EOT
  Used to calculate the subnet CIDR using terraform's cidrsubnet(prefix, newbits, netnum).

  A whole number that can be represented as a binary integer with no more than newbits binary digits,
  which will be used to populate the additional bits added to the prefix."
  EOT
}

variable "aws_vpc__name" {}
variable "aws_vpc__cidr_block" {}
variable "aws_route_table__name" {}
variable "aws_network_acl__name" {}
variable "aws_subnet__public__name" {}
variable "aws_subnet__private__name" {}
variable "aws_internet_gateway__name" {}
