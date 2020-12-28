terraform {
  backend "remote" {
    hostname = "app.terraform.io"
    organization = "drilococo"

    workspaces {
      prefix = "eks-cluster-"
    }
  }
}

data "terraform_remote_state" "networking" {
  backend = "remote"

  config = {
    hostname = "app.terraform.io"
    organization = "drilococo"

    workspaces = {
      name = "networking-${var.environment}"
    }
  }
}
