# Internet gateway to route traffic from public subnets
resource "aws_internet_gateway" "igw" {
    vpc_id = aws_vpc.vpc.id

    tags = {
        Name = "${var.app}-igw"
        env = local.env_val
    }
}

# NAT gateway to route internet traffic from private subnets
resource "aws_nat_gateway" "ngw" {
    allocation_id = aws_eip.eip.id
    subnet_id = aws_subnet.public-subnet[local.azs[0]].id
}

# Elastic IP for NAT gateway
resource "aws_eip" "eip" {
}