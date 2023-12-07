resource "aws_subnet" "main" {
  for_each = var.subnets
  vpc_id = var.vpc_id
  availability_zone = each.value["az"]
  cidr_block = each.value["cidr"]
  tags = {
    Name = each.key
  }
}

resource "aws_route_table" "main" {
  for_each = var.subnets
  vpc_id = var.vpc_id
  tags = {
    Name = each.key
  }
}

resource "aws_route_table_association" "a" {
  for_each = var.subnets
  subnet_id      = lookup(lookup(aws_subnet.main,each.key, null),"id", null)
  route_table_id = lookup(lookup(aws_route_table.main,each.key, null),"id", null)
}

