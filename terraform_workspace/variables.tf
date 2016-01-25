variable "access_key" {}
variable "secret_key" {}
variable "aws_key_name" {}

variable "aws_key_file_path" {
  description = "key file path"
  default = "/home/ubuntu/key_prive/sample.pem"
}

variable "region" {
    default = "us-west-2"
}
variable "amis" {
    default = {
        us-east-1 = "ami-9abea4fb"
        us-west-2 = "ami-9abea4fb"
    }
}
# Prod VPC
variable "vpc" {
      default = {
        vpc-prod = "vpc-d18fc1b4"
      }
}
# security groups 
variable "security_groups" {
   default = {
      launch-wizard-1 = "sg-8531c6e2"
      adamd-basic = "sg-8531c6e2"
   }
}
