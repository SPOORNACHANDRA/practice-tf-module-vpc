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

#resource "aws_route" "r" {
#  route_table_id         = "rtb-4fbb3ac4"
#  destination_cidr_block = "10.0.1.0/22"
#}