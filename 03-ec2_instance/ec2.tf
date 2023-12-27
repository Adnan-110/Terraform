  resource "aws_instance" "web" {
    ami           = "ami-0f75a13ad2e340a58"           #argument
    instance_type = "t2.micro"
    vpc_security_group_ids = [aws_security_group.allow_tls.id]

  tags = {
    Name          = "Demo1"
    }
  }

 


    