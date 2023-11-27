# Fetch all availability zones for current selected region
data "aws_availability_zones" "available" {
  state = "available"
}

# Find available VPCs in current account
data "aws_vpcs" "all_vpcs" {
}