terraform {
  backend "remote" {
    hostname = "app.terraform.io"
    organization = "drilococo"

    workspaces {
      prefix = "ecr-"
    }
  }
}
