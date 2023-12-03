resource "aws_subnet" "main" {
  for_each = var.subnets
  vpc_id = var.vpc_id
  cidr_block = each.value["cidr"]
  availability_zone = each.value["az"]
  tags = {
    name = each.key
  }
}



variable "subnets" {}
variable "vpc_id" {}


resource "aws_subnet" "main" {
  for_each = var.subnets
  vpc_id     = var.vpc_id
  cidr_block = each.value["cidr"]
  availability_zone = each.value["az"]
  tags = {
    Name = each.key
  }
}