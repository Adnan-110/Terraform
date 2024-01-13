terraform {
  backend "s3" {
    bucket  = "adnan-tf-state-bucket"
    key     = "new/terraform.tfstate"
    region  = "us-east-1"
  }
} 