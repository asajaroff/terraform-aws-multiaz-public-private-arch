output "availability_zones" {
  value = "${data.aws_availability_zones.available.names}"
}

output "aws_vpc" {
  value = "${aws_vpc.main.id}"
}

output "elastic_ip_nat_1" {
  value = "${aws_eip.nat[0].public_ip}"
}
output "elastic_ip_nat_2" {
  value = "${aws_eip.nat[1].public_ip}"
}

output "alb-url" {
  value = "${aws_lb.test.dns_name}"
}
