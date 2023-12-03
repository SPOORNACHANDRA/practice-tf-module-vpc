resource "aws_vpc" "main" {
  for_each = var.components
  cidr_block = var.cidr
  tags = {
    name = each.key
  }
}


variable "components" {}