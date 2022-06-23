terraform {
  cloud {
    organization = "nealajpatel"

    workspaces {
      name = "aws-oidc"
    }
  }
}

provider "aws" {}
