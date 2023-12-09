output "subnet_ids" {        #for attaching igw to public subnets only
  value = aws_subnet.main     # first of all these guy has to send out the info to the tf-module-vpc main.tf
}


output "route_table_ids" {      #for attaching igw to public subnets only
  value = aws_route_table.main   # first of all these guy has to send out the info to the tf-module-vpc main.tf
}

#output "vpc_id" {
#  value = aws_vpc.main.id
#}

output "ngw" {
  value = aws_route_table_association.a
}