resource "aws_vpc" "main" {         #we are consuming the variables here
  cidr_block = var.cidr
}
