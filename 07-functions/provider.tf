provider "aws" {}

terraform {
  backend "s3" {
    bucket  = "ak-tf-state-bucket"
    key     = "functions/terraform.tfstate"
    region  = "us-east-1"
  }
} 