resource "aws_vpc" "main" {
  cidr_block = var.cidr
}


module "subnets" {
  for_each = var.subnets
  source = "./subnets"
  subnets = each.value
  vpc_id = aws_vpc.main.id
}

resource "aws_internet_gateway" "igw" {
  vpc_id = aws_vpc.main.id
  tags = {
    Name = "main"
  }
}

#output "subnet" {
#  value = module.subnets
#}

resource "aws_route_table" "main" {
  for_each = var.subnets
  vpc_id = aws_vpc.main.id
  tags = {
    Name = each.key
  }
}