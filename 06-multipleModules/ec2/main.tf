resource "aws_instance" "app" {
    ami = data.aws_ami.ami.id
    instance_type = "t2.micro"
    vpc_security_group_ids = [var.securityGroup]  # Using the Variable

    tags = {
      Name = "EC2-From_Modules"
    }
    

#  Declaring the resource with in the resource!!! 
#  Demo On Local Provisioner 
#  provisioner "local-exec" {
#     command = "echo ${self.private_ip} >> /home/centos/local_private_ips.txt"
#   }
}

# Step 3: Declare Input that you want to use as variable
variable "securityGroup" {}

output "public_ip" {
    value = aws_instance.app.public_ip
}