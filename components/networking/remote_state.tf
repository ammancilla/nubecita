# reference: https://www.terraform.io/docs/configuration/blocks/backends/index.html

terraform {
  backend "local" {
    path = "remote_state__networking.tfstate"
  }
}

# data "terraform_remote_state" "networking" {
#   backend = "local"

#   config = {
#     path = "${path.module}/remote_state__networking.tfstate"
#   }
# }
