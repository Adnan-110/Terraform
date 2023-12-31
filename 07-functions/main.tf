  resource "aws_instance" "web" {
# Here we used count function, The number will will provide it will create that many instances/resources. If we give count=0 then no instance/resource will be created.
    count                   = 3
    ami                     = "ami-0f75a13ad2e340a58"           #argument
    instance_type           = "t2.micro"
    vpc_security_group_ids  = [aws_security_group.allow_tls.id]

  tags = {
    Name          = "Demo-${count.index+1}"
    }
  }

 


    