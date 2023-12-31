output "vpc_id" {
    value = aws_vpc.vpc.id
}

output "vpc_cidr_block" {
    value = aws_vpc.vpc.cidr_block
}

output "present_vpcs" {
    value = data.aws_vpcs.all_vpcs.ids
}

output "private_subnet_ids" {
    value = local.private_subnet_IDs
}

output "public_subnet_ids" {
    value = local.public_subnet_IDs
}