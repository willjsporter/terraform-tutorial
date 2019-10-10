variable "region" {
  default = "eu-west-1"
}

variable "vpc_cidr_block" {
  default = "172.18.0.0/16"
}

variable "subnet_cidr_block" {
  type    = "list"
  default = [ "172.18.1.0/24", "172.18.2.0/24", "172.18.3.0/24" ]
}

data "aws_availability_zones" "azs" {}