resource "aws_eip" "nat" {
  count = 2
}
resource "aws_nat_gateway" "nat_1" {
  allocation_id = "${aws_eip.nat[0].id}"
  subnet_id = "${aws_subnet.public_nat_1.id}"
}

resource "aws_nat_gateway" "nat_2" {
  allocation_id = "${aws_eip.nat[1].id}"
  subnet_id = "${aws_subnet.public_nat_2.id}"
}

# allow internet access to nat #1
resource "aws_route_table" "public_1_internet" {
  vpc_id = "${aws_vpc.main.id}"

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = "${aws_internet_gateway.main.id}"
  }

  tags = "${merge(map(
    "Name", "${local.name}-nat-${data.aws_availability_zones.available.names[0]}-rt",
  ), local.common_tags )}"
}
resource "aws_route_table_association" "internet_for_public_1" {
  route_table_id = "${aws_route_table.public_1_internet.id}"
  subnet_id      = "${aws_subnet.public_nat_1.id}"
}

# allow internet access to nat #2
resource "aws_route_table" "public_2_internet" {
  vpc_id = "${aws_vpc.main.id}"

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = "${aws_internet_gateway.main.id}"
  }

  tags = "${merge(map(
    "Name", "${local.name}-nat-${data.aws_availability_zones.available.names[1]}-rt",
  ), local.common_tags )}"
}
resource "aws_route_table_association" "internet_for_public_2" {
  route_table_id = "${aws_route_table.public_2_internet.id}"
  subnet_id = "${aws_subnet.public_nat_2.id}"
}