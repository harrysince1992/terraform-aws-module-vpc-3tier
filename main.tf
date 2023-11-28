# Local variables

locals {
    azs =   slice(data.aws_availability_zones.available.names, 0, var.number_of_subnets_required )
    subnets_cidr = chunklist(cidrsubnets(var.vpc_cidr_block, [for i in range(var.number_of_subnets_required * 2) : "8"]...), var.number_of_subnets_required)
    private_az_cidr_map = zipmap(local.azs, local.subnets_cidr[0])
    public_az_cidr_map = zipmap(local.azs, local.subnets_cidr[1])
    env_val = "${var.app}-${terraform.workspace}"

    private_subnet_IDs = [ for az in aws_subnet.private_subnet: az.id ]
    public_subnet_IDs = [ for az in aws_subnet.public-subnet: az.id ]
}

# Create a VPC first
resource "aws_vpc" "vpc" {
    cidr_block = var.vpc_cidr_block

    tags = {
        Name = "${var.app}-vpc",
        env = local.env_val
    }
}

