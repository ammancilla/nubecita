variable "environment" {
  description = "The working environment"
}

variable "terraform__location" {}

variable "aws_availability_zones__names" {
  type = list(string)
  description = "List of AZ of the AWS region"
}

variable "aws_role__name" {
  description = "The name of the IAM role to be assumed by the EKS Cluster"
}

