output "availability_zones" {
  value = "${data.aws_availability_zones.available.names}"
}

output "aws_vpc" {
  value = "${aws_vpc.main.id}"
}

output "primary_subnet_id" {
  value = "${aws_subnet.primary.id}"
  # value = "${aws_subnet.primary.}"
}
output "primary_subnet_cidr" {
  value = "${aws_subnet.primary.cidr_block}"
}
 