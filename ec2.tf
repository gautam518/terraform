resource "aws_instance" "web" {
  ami                         = var.image_id
  instance_type               = var.instance_types
  associate_public_ip_address = true
  key_name                    = aws_key_pair.deployer-key.key_name
  vpc_security_group_ids      = ["${aws_security_group.private_sg.id}"]
  #vpc_id                 = aws_vpc.vpc_dev.id
  subnet_id = aws_subnet.public.id
  tags = {
    Name = "first-tf-instance"
  }
}