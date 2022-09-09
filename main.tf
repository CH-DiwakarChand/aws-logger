terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 3.27"
    }
  }

  required_version = "= 1.1.4"
}

variable "aws_access_key" {}

variable "aws_secret_key" {}

variable "aws_region" {}

provider "aws" {
  access_key = var.aws_access_key
  secret_key = var.aws_secret_key
  region     = var.aws_region
}


# resource "aws_elasticsearch_domain" "logger_domain" {
#   domain_name           = "aws-es-logger"
#   elasticsearch_version = "7.10"
#
#   ebs_options {
#     ebs_enabled = true
#     volume_size = 40
#   }
#
#   tags = {
#     Name = "aws_logger"
#   }
# }
#
# resource "aws_instance" "aws-logger-micro-ec2" {
#   ami           = "ami-033b95fb8079dc481"
#   instance_type = "t2.micro"
#
#   tags = {
#     Name = "aws_logger"
#   }
#
# }


variable "log_groups" {
  type = set(string)
  default = [
    "test1",
    "test2",
    "test3"
  ]
}
#
# resource "aws_cloudwatch_log_group" "log_group" {
#   for_each          = var.log_groups
#   name              = each.value
#   retention_in_days = 3
# }

data "aws_cloudwatch_log_groups" "example" {
  log_group_name_prefix = "tes"
}

output "some" {
  description = "ID of project VPC"
  value       = data.aws_cloudwatch_log_groups.example
}


resource "aws_cloudwatch_log_group" "some" {
  # (resource arguments)
}
