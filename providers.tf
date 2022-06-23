terraform {
  cloud {
    organization = "alliebarnett44"

    workspaces {
      name = "aws-oidc"
    }
  }
}

provider "aws" {}
