resource "aws_key_pair" "deployer-key" {
  key_name   = "first-key"
  public_key = file("${path.module}/id_rsa.pub")
}
output "keyname" {
  value = aws_key_pair.deployer-key.key_name
}