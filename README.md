This is a custom VPC module to create below infrastructure for Applications

It creates below resources:

1. a VPC
2. public and private subnets in different availability zones, depending on region chose by User
3. an Internet Gateway to allow internet traffic from public subnets
4. a NAT gateway to allow internet traffic from private subnets
5. Route tables for public and private subnets and thier associations with proper routes

INPUTS Required:

1. access_key (REQUIRED): AWS access key which has proper privileges to create required resources
2. secret_key (REQUIRED): AWS secret key which has proper privileges to create required resources
3. REGION (Optional): AWS region to choose (default: us-east-1)
4. app (REQUIRED): your application name
5. vpc_cidr_block (OPTIONAL): vpc CIDR (default: 10.0.0.0/16)
6. number_of_subnets_required (OPTIONAL): Number of private/public subnets to create (default: 2 ; this means 2 public and 2 private subnets ). It can only be 2 or 3 as of now.

OUTPUTS:

1. vpc_id: created VPC's ID
2. vpc_cidr_block: created VPC's CIDR block
3. present_vpcs: Total created VPC's IDs in the chosen region
