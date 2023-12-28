resource "aws_instance" "web" {
    ami           = data.aws_ami.ami.id           #argument
    instance_type = "t2.micro"
    vpc_security_group_ids = [aws_security_group.allow_tls.id]

    tags = {
    Name          = "Demo1"
    }
}

