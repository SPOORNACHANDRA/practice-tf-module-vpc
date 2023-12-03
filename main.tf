resource "aws_vpc" "main" {
  cidr_block = var.cidr
}

resource "aws_subnet" "main" {
  for_each = var.subnets
  vpc_id = var.vpc_id
  availability_zone = each.value["az"]
  cidr_block = each.value["cidr"]
}


variable "vpc_id" {}