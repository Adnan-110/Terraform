resource "aws_security_group" "everything_allowed" {
    name        = "everything_allowed"
    description = "Allow all traffic"

    ingress {
        description = "SSH from VPC"
        from_port   = 22
        to_port     = 22
        protocol    = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
    }

    egress {
        from_port   = 0
        to_port     = 0
        protocol    = "-1"
        cidr_blocks = ["0.0.0.0/0"]
    }

    tags = {
        Name = "everything_allowed"
    }
}

# Step 1: Declare the information that you want it to be shared as an OUTPUT

output "securityGroup" {
    value = aws_security_group.everything_allowed.id
}