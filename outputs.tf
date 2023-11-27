output "vpc_id" {
    value = aws_vpc.vpc.id
}

output "present_vpcs" {
    value = data.aws_vpcs.all_vpcs.ids
}
