resource "aws_vpc" "main" {         #we are consuming the variables here
  cidr_block = var.cidr
}


module "subnets" {
  source = "./subnets"
  for_each = var.subnets
  subnets = each.value
  vpc_id  = aws_vpc.main.id
}