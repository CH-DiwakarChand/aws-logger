terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 3.27"
    }
  }

  required_version = "= 0.12.21"
}

variable "aws_access_key" {}

variable "aws_secret_key" {}

variable "aws_region" {}

provider "aws" {
  access_key = var.aws_access_key
  secret_key = var.aws_secret_key
  region     = var.aws_region
}

resource "aws_instance" "aws-logger-micro-ec2" {
  ami           = "ami-830c94e3"
  instance_type = "t2.micro"
}
