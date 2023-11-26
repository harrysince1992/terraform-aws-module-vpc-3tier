# Local variables

locals {
    public_subnets = {
        public-subnet-1: ["10.0.0.0/26", "us-east-1a"],
        public-subnet-2: ["10.0.0.64/26", "us-east-1b"]
    }

    private_subnets = {
        private_subnet-1: ["10.0.0.128/26", "us-east-1a"]
        private-subnet-2: ["10.0.0.192/26", "us-east-1b"]
    }
}

# Create a VPC first

resource "aws_vpc" "vpc" {
    cidr_block = "10.0.0.0/16"

    tags = {
        name = "terraform-solution"
    }
}

resource "aws_subnet" "public-subnet" {
    vpc_id = aws_vpc.vpc.id

    for_each = local.public_subnets
    cidr_block = each.value[0]
    availability_zone = each.value[1]
    map_public_ip_on_launch = true

    tags = {
        Name = each.key,
        Solution = "terraform-module"
    }
}

resource "aws_subnet" "private_subnet" {
    vpc_id = aws_vpc.vpc.id

    for_each = local.private_subnets
    cidr_block = each.value[0]
    availability_zone = each.value[1]
    map_public_ip_on_launch = true

    tags = {
        Name = each.key,
        Solution = "terraform-module"
    }
}


