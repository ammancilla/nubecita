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
  description = "List of AZ of the AWS region"
  type = list(string)
}

variable "aws_role__eks_cluster__name" {
  description = "The name of the IAM role to be assumed by the EKS Cluster"
  type = string
}

variable "aws_eks__cluster__subnet_ids" {
  description = "The ids of the subnets where EKS will be provisioned"
  type = list(string)
}
variable "aws_eks__cluster__name" {}
variable "aws_eks__cluster__kubernetes_version" {}
variable "aws_eks__cluster__public_access_cidrs" {
  description = "Indicates which CIDR blocks can access the Amazon EKS public API server endpoint when enabled."
  type = list(string)
  default = ["0.0.0.0/0"]
}
