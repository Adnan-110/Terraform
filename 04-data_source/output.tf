output "instance_dns" {
    value         = aws_instance.web.private_dns              #attribute
  }

 output "instance_arn" {
    value         = aws_instance.web.arn                      #attribute
  }