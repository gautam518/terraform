vpc_cidr = "10.0.0.0/16"
public_subnet = "10.0.1.0/24"
private_subnet = "10.0.2.0/24"
ports = [80, 443, 22]
instance_types ="t2.micro"
regions    = "us-east-1"
#image_name = "ubuntu/images/hvm-ssd/ubuntu-jammy-22.04-amd64-server-*"
image_id = "ami-06b09bfacae1453cb"
