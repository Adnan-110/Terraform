terraform {
  backend "s3" {
    bucket  = "ak-tf-state-bucket"
    key     = "basics/terraform.tfstate"
    region  = "us-east-1"
  }
} 