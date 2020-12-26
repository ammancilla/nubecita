variable "environment" {}
variable "aws_region__name" {}
variable "aws_profile__name" {}
variable "aws_availability_zones__names" {
  default = ["eu-central-1a", "eu-central-1b", "eu-central-1c"]
}
variable "aws_role__name" {}
variable "terraform__location" {
  default = "components/eks/main.tf"
}
