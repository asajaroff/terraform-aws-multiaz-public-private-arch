data "aws_availability_zones" "available" {
  state = "available"
}
# VPC
resource "aws_vpc" "main" {
  cidr_block                        = "${var.cidr_block}"
  instance_tenancy                  = "default"
  enable_dns_support                = true
  enable_dns_hostnames              = true
  assign_generated_ipv6_cidr_block  = false
  tags = "${merge(map(
    "Name", "${local.name}-vpc",
  ), local.common_tags )}"
}

resource "aws_internet_gateway" "main" {
  vpc_id = "${aws_vpc.main.id}"
  tags = "${merge(map(
    "Name", "${local.name}-igw",
  ), local.common_tags )}"
}

# Subnets
resource "aws_subnet" "primary" {
  vpc_id            = "${aws_vpc.main.id}"
  cidr_block        = "${cidrsubnet("${var.cidr_block}", 4, 0)}"
  availability_zone = "${data.aws_availability_zones.available.names[0]}"
    tags = "${merge(map(
    "Name", "${local.name}-${data.aws_availability_zones.available.names[0]}",
  ), local.common_tags )}"
  # ...
}

resource "aws_subnet" "secondary" {
  vpc_id            = "${aws_vpc.main.id}"
  cidr_block        = "${cidrsubnet("${var.cidr_block}", 4, 1)}"
  availability_zone = "${data.aws_availability_zones.available.names[1]}"

  # ...
}
