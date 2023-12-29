resource "aws_instance" "web" {
    ami = data.aws_ami.ami.id
    instance_type = "t2.micro"
}