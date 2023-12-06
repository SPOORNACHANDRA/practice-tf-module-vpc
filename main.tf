resource "aws_vpc" "main" {
  for_each = var.cidr
  cidr_block = each.value["cidr"]
}

