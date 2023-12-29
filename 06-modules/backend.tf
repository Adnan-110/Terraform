terraform {
  backend "s3" {
    bucket  = "ak-tf-state-bucket"
    key     = "module/terraform.tfstate"
    region  = "us-east-1"
  }
} 