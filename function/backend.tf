terraform {
  backend "s3" {
    bucket = "akash-s3-tfstate"
    key    = "devops.tfstate"
    region = "us-east-2"
  }
}
