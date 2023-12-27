resource "aws_instance" "web" {
  ami           = "ami-0f75a13ad2e340a58"           #attribute
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