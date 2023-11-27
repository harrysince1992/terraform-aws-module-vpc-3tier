variable "access_key" {}
variable "secret_key" {}
variable "REGION" {
    default = "us-east-1"
}

variable "app" {
    default = "myapp"
}

variable "vpc_cidr_block" {
    description = "CIDR block for the VPC to create."
    default = "10.0.0.0/16"
}

variable "number_of_subnets_required" {
    description = "number of subnets(public/private) to create"
    type = number
    default = 2
    validation {
      condition = var.number_of_subnets_required == 2 || var.number_of_subnets_required == 3
      error_message = "subnet can be spanned to two or three only"
    }
}
