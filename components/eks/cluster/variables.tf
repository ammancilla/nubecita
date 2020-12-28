variable "environment" {}
variable "default_tags" {}

variable "aws_provider__region" {}
variable "aws_provider__profile" {}
variable "aws_availability_zones__names" {}

variable "aws_eks__cluster__name" {}
variable "aws_eks__cluster__subnet_ids" {}
variable "aws_eks__cluster__kubernetes_version" {}
variable "aws_eks__cluster__public_access_cidrs" {
  default = ["0.0.0.0/0"]
}

variable "aws_role__eks_cluster__name" {}
