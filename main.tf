resource "aws_vpc" "main" {         #we are consuming the variables here
  cidr_block = var.cidr
}


module "subnets" {
  for_each = var.subnets
  source = "./subnets"

  subnets = each.value
  vpc_id  = aws_vpc.main.id
}



}

module "subnets" {            # we have subnets in that subnets in that subnet we have multiple subnets in that subnets we have multiple values
#we have so that we created another module called subnets so we are sending the information
for_each = var.subnets      # how many subnets we need so that we create a for_each so that it iterates those many times
source = "./subnets"
subnets = each.value        # this we created becoz we have multiple subnets in that subnets we have multiple sub-subnets  we are sending the info
vpc_id = aws_vpc.main.id
}