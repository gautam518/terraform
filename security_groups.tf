#to add security group
resource "aws_security_group" "allow_tls" {
  name        = "sg_public_dev"
  description = "Allow TLS inbound traffic"
  vpc_id      = aws_vpc.vpc_dev.id

  dynamic "ingress" {
    for_each = var.ports
    iterator = port
    content {
      description = "TLS from VPC"
      from_port   = port.value
      to_port     = port.value
      protocol    = "tcp"
      cidr_blocks = ["0.0.0.0/0"]
    }
  }
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

resource "aws_security_group" "private_sg" {
  name        = "sg_private_dev"
  description = "Allow inbound traffic"
  vpc_id      = aws_vpc.vpc_dev.id

  dynamic "ingress" {
    for_each = var.ports
    iterator = port
    content {
      description = "TLS from VPC"
      from_port   = port.value
      to_port     = port.value
      protocol    = "tcp"
      cidr_blocks = ["182.76.169.162/32"]
    }
  }
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}



output "securitygroupdetails" {
  value = aws_security_group.allow_tls.id
}

output "secondsecuritygroups" {
  value = aws_security_group.private_sg.id
}

