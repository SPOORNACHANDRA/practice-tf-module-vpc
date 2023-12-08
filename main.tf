resource "aws_vpc" "main" {         #we are consuming the variables here
  cidr_block = var.cidr
}


module "subnets" {
  source = "./subnets"
  for_each = var.subnets
  subnets = each.value
  vpc_id  = aws_vpc.main.id
}

resource "aws_internet_gateway" "igw" {
  vpc_id = aws_vpc.main.id

  tags = {
    Name = "main"
  }
}

resource "aws_route" "igw" {
  for_each               = lookup(lookup(module.subnets, "public", null), "route_table_ids", null)
  route_table_id         = each.value["id"]
  destination_cidr_block = "0.0.0.0/0"
  gateway_id = aws_internet_gateway.igw.id
}
#
#resource "aws_route_table" "example" {
#  vpc_id = aws_vpc.example.id
#
#  route {
#    cidr_block = "10.0.1.0/24"
#    gateway_id = aws_internet_gateway.example.id
#  }

output "subnet" {
  value = module.subnets
}
