resource "aws_vpc" "main" {
  cidr_block = var.cidr
}



resource "aws_subnet" "main" {
  availability_zone = var.az
  cidr_block = var.cidr
  subnets =var.subnets
}