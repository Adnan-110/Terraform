resource "aws_instance" "web" {
  ami           = "ami-0f75a13ad2e340a58"           #argument
  instance_type = "t2.micro"

  tags = {
    Name = "Demo1"
  }
}

output "instance_dns" {
  value = aws_instance.web.private_dns              #attribute
}

output "instance_arn" {
  value = aws_instance.web.arn                      #attribute
}


resource "aws_security_group" "allow_tls" {
  name        = "allow_tls"
  description = "Allow TLS inbound traffic"

  ingress {
    description      = "SSH from VPC"
    from_port        = 22
    to_port          = 22
    protocol         = "tcp"
    cidr_blocks      = ["0.0.0.0/0"]
  }

  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
  }

  tags = {
    Name = "allow_tls"
  }
}