##############################################
# Public subnets                        #
##############################################

resource "aws_subnet" "public-subnet" {
    for_each = local.public_az_cidr_map
    vpc_id = aws_vpc.vpc.id
    cidr_block = each.value
    map_public_ip_on_launch = true
    availability_zone = each.key

    tags = {
        Name = "${var.app}-public-subnet-${each.key}"
        env = local.env_val
    }
}

##############################################
# Private subnets                            #
##############################################

resource "aws_subnet" "private_subnet" {
    for_each = local.private_az_cidr_map
    vpc_id = aws_vpc.vpc.id
    cidr_block = each.value
    availability_zone = each.key
    tags = {
        Name = "${var.app}-private-subnet-${each.key}"
        env = local.env_val
    }
}
