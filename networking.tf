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
resource "aws_subnet" "public_nat_1" {
  vpc_id            = "${aws_vpc.main.id}"
  cidr_block        = "${cidrsubnet("${var.cidr_block}", 8, 0)}"
  availability_zone = "${data.aws_availability_zones.available.names[0]}"

  tags = "${merge(map(
    "Name", "${local.name}-nat-${data.aws_availability_zones.available.names[0]}",
  ), local.common_tags )}"
}

resource "aws_subnet" "public_nat_2" {
  vpc_id            = "${aws_vpc.main.id}"
  cidr_block        = "${cidrsubnet("${var.cidr_block}", 8, 1)}"
  availability_zone = "${data.aws_availability_zones.available.names[1]}"

  tags = "${merge(map(
    "Name", "${local.name}-nat-${data.aws_availability_zones.available.names[1]}",
  ), local.common_tags )}"
}

resource "aws_subnet" "application-1" {
  vpc_id            = "${aws_vpc.main.id}"
  cidr_block        = "${cidrsubnet("${var.cidr_block}", 8, 2)}"
  availability_zone = "${data.aws_availability_zones.available.names[0]}"

  tags = "${merge(map(
    "Name", "${local.name}-application-${data.aws_availability_zones.available.names[0]}",
  ), local.common_tags )}"
}

resource "aws_subnet" "application-2" {
  vpc_id            = "${aws_vpc.main.id}"
  cidr_block        = "${cidrsubnet("${var.cidr_block}", 8, 3)}"
  availability_zone = "${data.aws_availability_zones.available.names[1]}"

  tags = "${merge(map(
    "Name", "${local.name}-application-${data.aws_availability_zones.available.names[1]}",
  ), local.common_tags )}"
}

resource "aws_subnet" "persistence-1" {
  vpc_id            = "${aws_vpc.main.id}"
  cidr_block        = "${cidrsubnet("${var.cidr_block}", 8, 4)}"
  availability_zone = "${data.aws_availability_zones.available.names[0]}"

  tags = "${merge(map(
    "Name", "${local.name}-persistence-${data.aws_availability_zones.available.names[0]}",
  ), local.common_tags )}"
}

resource "aws_subnet" "persistence-2" {
  vpc_id            = "${aws_vpc.main.id}"
  cidr_block        = "${cidrsubnet("${var.cidr_block}", 8, 5)}"
  availability_zone = "${data.aws_availability_zones.available.names[1]}"

  tags = "${merge(map(
    "Name", "${local.name}-presistence-${data.aws_availability_zones.available.names[1]}",
  ), local.common_tags )}"
}