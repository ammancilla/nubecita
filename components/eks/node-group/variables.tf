variable "environment" {}
variable "default_tags" {}

variable "aws_provider__region" {}
variable "aws_provider__profile" {}

variable "role__name" {}
variable "policy__name" {}
variable "cluster__name" {}

variable "node_group__name" {}
variable "node_group__subnet_ids" {}
variable "node_group__desired_size" {}
variable "node_group__max_size" {}
variable "node_group__min_size" {}
variable "node_group__instance_type" {}
