resource "aws_instance" "web" {
  ami           = "ami-0f75a13ad2e340a58"           #argument
instance_type = "t2.micro"

  tags = {
    Name = "HelloWorld"
  }
}