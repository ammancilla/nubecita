#
# References:
# • https://www.terraform.io/docs/configuration/blocks/backends/index.html
# • https://www.terraform.io/docs/backends/types/local.html
# • https://www.terraform.io/docs/backends/types/remote.html
# • https://www.terraform.io/docs/backends/types/s3.html
#

terraform {
  backend "remote" {
    hostname = "app.terraform.io"
    organization = "drilococo"

    workspaces {
      name = "nubecita"
    }
  }
}

# terraform {
#   backend "local" {
#     path = var.backend__local__path
#   }
# }

# terraform {
#   backend "s3" {
#     bucket = "mybucket"
#     key    = "path/to/my/key"
#     region = "us-east-1"
#   }
# }

