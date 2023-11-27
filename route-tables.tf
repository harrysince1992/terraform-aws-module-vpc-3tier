# Route tables for our public and private subnets

resource "aws_route_table" "public-rt" {
    vpc_id = aws_vpc.vpc.id

    route {
        cidr_block = "0.0.0.0/0"
        gateway_id = aws_internet_gateway.igw.id
    }

    tags = {
        Name = "${var.app}-public-route-table"
        env = local.env_val
    }
}

resource "aws_route_table" "private-rt" {
    vpc_id = aws_vpc.vpc.id

    route {
        cidr_block = "0.0.0.0/0"
        gateway_id = aws_nat_gateway.ngw.id
    }

    tags = {
        Name = "${var.app}-private-route-table"
        env = local.env_val
    }
}

# Subnet associations with Route Tables

resource "aws_route_table_association" "public-rta" {
    for_each = aws_subnet.public-subnet
    subnet_id = each.value.id
    route_table_id = aws_route_table.public-rt.id

}

resource "aws_route_table_association" "private-rta" {
    for_each = aws_subnet.private_subnet
    subnet_id = each.value.id
    route_table_id = aws_route_table.private-rt.id
}