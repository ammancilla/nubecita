variable "environment" {
  description = "The working environment"
  type = string
}

variable "default_tags" {
  description = "A map of tags to add to all resources"
  type        = map(string)
  default     = {}
}

variable "policy__name" {
  description = "The name of IAM policy to enable autoscaling of the Node Group "
  type = string
}

variable "role__name" {
  description = "The name of the IAM role to be assumed by the Node Group"
  type = string
}

variable "cluster__name" {
  description = "The name of the EKS cluster"
  type = string
}

variable "node_group__name" {
  description = "The name of the EKS Node Group to create"
  type = string
}

variable "node_group__subnet_ids" {
  description = "The ids of subnets to provision the Node EC2 instances"
  type = list(string)
}

variable "node_group__desired_size" {
  description = "The desired number of nodes in the EKS Node Group"
  type = number
}

variable "node_group__max_size" {
  description = "The maximum number of nodes in the EKS Node Group"
  type = number
}

variable "node_group__min_size" {
  description = "The minimum number of nodes in the EKS Node Group"
  type = number
}

variable "node_group__instance_type" {
  description = "The EC2 instance type to be launch for each node in the EKS Node Group"
  type = list(string)
}
