provider "aws" {}

terraform {
  backend "s3" {
    bucket  = "adnan-tf-state-bucket"
    key     = "functions/terraform.tfstate"
    region  = "us-east-1"
  }
} 