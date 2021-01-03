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
  description = "List of AZ of the AWS region"
  type = list(string)
}

variable "cluster__role__name" {
  description = "The name of the IAM role to be assumed by the EKS Cluster"
  type = string
}

variable "cluster__subnet_ids" {
  description = "The ids of the subnets where EKS will be provisioned"
  type = list(string)
}
variable "cluster__name" {}
variable "cluster__kubernetes_version" {}
variable "cluster__public_access_cidrs" {
  description = "Indicates which CIDR blocks can access the Amazon EKS public API server endpoint when enabled."
  type = list(string)
  default = ["0.0.0.0/0"]
}
