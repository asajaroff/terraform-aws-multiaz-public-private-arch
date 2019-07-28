variable "namespace" {
  description = "Namespace for the application, e.g. 'product' or 'application'"
  default = "ns"
}
variable "application" {
  description = "Application name, e.g. 'app' or 'cluster'"
  default = "app"
}
variable "owner" {
  description = "Owner of the Infrastructure, e.g. 'BusinessUnit'"
  default = ""
}
variable "environment" {
  description = "Environment name, e.g. 'testing' or 'production'"
  default = "testing"
}
variable "mantainer" {
  description = "Email of mantainer, e.g. 'you@email.com'"
}
variable "cidr_block" {
    description = "CIDR Block for the VPC."
}
variable "aws_region" {
  default = "us-west-1"
}