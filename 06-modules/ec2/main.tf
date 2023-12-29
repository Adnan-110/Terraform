resource "aws_instance" "app" {
    ami = data.aws_ami.ami.id
    instance_type = "t2.micro"
    vpc_security_group_ids = [var.securityGroup]  # Using the Variable

    tags = {
      name = "EC2-From_Modules"
    }
}

# Step 3: Declare Input that you want to use as variable
variable "securityGroup" {}

output "public_ip" {
    value = aws_instance.app.public_ip
}