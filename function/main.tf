provider "aws" {
  region  = var.region
  profile = "akashambadi"
}


terraform {
  required_version = "<= 1.2.9"
  required_providers {
    aws = {
      version = "<=4.0.0"
      source  = "hashicorp/aws"
    }
  }
}
