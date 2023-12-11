#output "subnets" {        #for attaching igw to public subnets only
#  value = module.subnets    # first of all these guy has to send out the info to the tf-module-vpc main.tf
#}
#
#
#output "route_table_ids" {      #for attaching igw to public subnets only
#  value = local.public_subnet_ids   # first of all these guy has to send out the info to the tf-module-vpc main.tf
#}
#
#output "vpc_id" {
#  value = aws_vpc.main.id
#}
