variable "environment" {
  description = "The working environment"
  type = string
}

variable "default_tags" {
  description = "A map of tags to add to all resources"
  type        = map(string)
  default     = {}
}

variable "availability_zones__names" {
  type = list(string)
  description = "List of AZ of the AWS region"
}

variable "subnet__cidrsubnet__newbits" {
  description = <<-EOT
  Used to calculate the subnet CIDR using terraform's cidrsubnet(prefix, newbits, netnum) function.

  It is the number of additional bits with which to extend the prefix. For example,
  if given a prefix ending in /16 and a newbits value of 4, the resulting subnet address will have length /20."
  EOT
}

variable "subnet__cidrsubnet__netnum" {
  description = <<-EOT
  Used to calculate the subnet CIDR using terraform's cidrsubnet(prefix, newbits, netnum).

  A whole number that can be represented as a binary integer with no more than newbits binary digits,
  which will be used to populate the additional bits added to the prefix."
  EOT
}

variable "ig__name" {}
variable "vpc__name" {}
variable "vpc__cidr_block" {}
variable "vpc__enable_dns_hostnames" {}
variable "route_table__name" {}
variable "network_acl__name" {}
variable "subnet__public__name" {}
variable "subnet__private__name" {}
