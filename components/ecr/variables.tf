variable "environment" {
  description = "The working environment"
  type = string
}

variable "default_tags" {
  description = "A map of tags to add to all resources"
  type        = map(string)
  default     = {}
}

variable "aws_provider__region" {}
variable "aws_provider__profile" {}

variable "ecr__repos" {
  description = "List of ECR repositories to create"
  type = list(
    object({
      name = string,
      scan_on_push = bool,
      image_tag_mutability = string
    })
  )
}
