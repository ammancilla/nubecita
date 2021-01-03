variable "environment" {}
variable "default_tags" {}
variable "availability_zones__names" {}

variable "provider__region" {}
variable "provider__profile" {}

variable "cluster__name" {}
variable "cluster__role__name" {}
variable "cluster__subnet_ids" {}
variable "cluster__kubernetes_version" {}
variable "cluster__public_access_cidrs" {
  default = ["0.0.0.0/0"]
}
