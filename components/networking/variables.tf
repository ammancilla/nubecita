variable "environment" {}
variable "default_tags" {}

variable "provider__region" {}
variable "provider__profile" {}

variable "availability_zones__names" {}

variable "vpc__name" {}
variable "vpc__cidr_block" {}
variable "vpc__enable_dns_hostnames" {}

variable "subnet__public__name" {}
variable "subnet__private__name" {}
variable "subnet__cidrsubnet__netnum" {}
variable "subnet__cidrsubnet__newbits" {}

variable "ig__name" {}
variable "route_table__name" {}
variable "network_acl__name" {}
