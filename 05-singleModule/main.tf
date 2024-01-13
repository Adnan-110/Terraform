# Root Module
provider "aws" {}

terraform {
  backend "s3" {
    bucket = "adnan-tf-state-bucket"
    key = "basics/terraform.tfstate"
    region = "us-east-1"
  }
}

# Calls Child Modules
module "local-module" {
    source = "./local"
  
}

# This is how we fetch the values from a backend Module.
# module.childModuleName.outputNameDeclaredInTheChildModule
output "instance_ip" {
  value = module.local-module.instance_ip
}