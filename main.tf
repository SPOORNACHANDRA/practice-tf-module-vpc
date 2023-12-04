resource "aws_vpc" "main" {
  cidr_block = var.cidr
}



resource "aws_subnet" "main" {
  for_each = var.subnets
  availability_zone = each.value["az"]
  cidr_block = each.value["cidr"]
  subnets =var.subnets
}