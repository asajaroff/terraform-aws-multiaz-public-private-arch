resource "aws_lb" "test" {
  name               = "${var.application}-alb"
  internal           = false
  load_balancer_type = "application"
  security_groups    = ["${aws_security_group.alb.id}"]
  subnets            = ["${aws_subnet.application-1.id}", "${aws_subnet.application-2.id}"]
# Correct Subnets
#  subnets            = ["${aws_subnet.public.*.id}"]
# Set to true for production
  enable_deletion_protection = false

# To Do: S3 Bucket for logs
#   access_logs {
#     bucket  = "${aws_s3_bucket.lb_logs.bucket}"
#     prefix  = "test-lb"
#     enabled = true
#   }

  tags = "${merge(map(
    "Name", "${local.name}-alb",
  ), local.common_tags )}"
}

resource "aws_security_group" "alb" {
  name        = "${local.name}-alb-sg"
  description = "SG for the Application Load Balancer of ${local.name}"
  vpc_id      = "${aws_vpc.main.id}"

  ingress {
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  # Allow all outbound traffic.
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = "${merge(map(
    "Name", "${local.name}-sg-alb",
  ), local.common_tags )}"
}