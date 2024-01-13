terraform {
  backend "s3" {
    bucket  = "adnan-tf-state-bucket"
    key     = "module/terraform.tfstate"
    region  = "us-east-1"
  }
} 