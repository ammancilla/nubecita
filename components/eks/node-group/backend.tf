terraform {
  backend "remote" {
    hostname = "app.terraform.io"
    organization = "drilococo"

    workspaces {
      prefix = "eks-node-group-"
    }
  }
}

data "terraform_remote_state" "eks-cluster" {
  backend = "remote"

  config = {
    hostname = "app.terraform.io"
    organization = "drilococo"

    workspaces = {
      name = "eks-cluster-${var.environment}"
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
