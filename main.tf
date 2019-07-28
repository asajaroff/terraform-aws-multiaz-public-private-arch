provider "aws" {
    version = "~> 2.0"
    region  = "${var.aws_region}"
}
locals {
  name = "${var.namespace}-${var.application}-${var.environment}"
  common_tags = {
  "Namespace"   = "${var.namespace}"
  "Environment" = "${var.environment}"
  "Application" = "${var.application}"
  "Mantainer"   = "${var.mantainer}"
  "Owner"       = "${var.owner}"
  }
}
terraform {
  backend "s3" {
    bucket = "terraform-sandbox-financiera"
    key    = "tfstates/project.tfstate"
    region = "us-east-1"
  }
}
