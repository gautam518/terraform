variable "ports" {
  type = list(number)
}

variable "instance_types" {
  type = string
}

variable "regions" {
  type = string
}

#variable "access_key" {
#  type = string
#}

#variable "secret_key" {
#  type = string
#}

#variable "image_name" {
#  type = string
#}

variable "image_id" {
  type = string
}

variable "vpc_cidr" {
  type = string
}

variable "public_subnet" {
  type = string
}

variable "private_subnet" {
  type = string
}










