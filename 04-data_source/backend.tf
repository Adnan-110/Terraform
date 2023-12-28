terraform {
  backend "s3" {
    bucket  = "ak-tf-state-bucket"
    key     = "new/terraform.tfstate"
    region  = "us-east-1"
  }
} 