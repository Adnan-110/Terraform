terraform {
  backend "s3" {
    bucket  = "ak-tf-state-bucket"
    key     = "bacics/terraform.tfstate"
    region  = "us-east-1"
  }
} 