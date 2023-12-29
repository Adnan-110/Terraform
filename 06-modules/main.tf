# This is root module

# Calling the Child Modules

# Calls ec2 child module
module "ec2" {
    source          = "./ec2"
    securityGroup   = module.securityGroup.securityGroup # Step 2: Passing the info that the module needs 
    # Here we passed the securityGroup Id which we received as output from securityGroup module to ec2 module
}

# Calls securityGroup child module
module "securityGroup" {
    source = "../03-ec2_instance"
}

output "public_ip" {
    value = module.ec2.public_ip
}