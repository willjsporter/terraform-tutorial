provider "aws" {
  shared_credentials_file = "~/.aws/credentials"
  profile = "playground"
  region = "${var.region}"
}

resource "aws_vpc" "tutorial" {
  cidr_block       = "${var.vpc_cidr_block}"
  instance_tenancy = "default"

  tags = {
    Name      = "tutorial"
    Location  = "Ireland"
  }
}

resource "aws_subnet" "subnet1" {
  count       = "${length(data.aws_availability_zones.azs.names)}"
  vpc_id      = "${aws_vpc.tutorial.id}"
  cidr_block  = "${element(var.subnet_cidr_block,count.index)}"
  availability_zone = "${element(data.aws_availability_zones.azs.names,count.index)}"

  tags = {
    Name      = "tutorial-subnet-${count.index + 1}"
    Location  = "Ireland"
  }
}