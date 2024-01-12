terraform {
  required_version = ">= 1.0.0"
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.0"
    }
  }
}

provider "aws" {
  region = "us-east-2"
}

variable "tags" {
  type = map(any)
  default = {
    "id"             = "1345"
    "owner"          = "BFA-OUAGADOUGOU"
    "teams"          = "DEL"
    "environment"    = "development"
    "project"        = "del"
    "create_by"      = "Terraform"
    "cloud_provider" = "aws"
  }
}

data "aws_caller_identity" "current" {}
data "aws_region" "current" {}

resource "aws_s3_bucket" "example_bucket1" {
  bucket = "${var.tags["environment"]}-s3-bucket-tester"
  tags   = var.tags
}

resource "aws_s3_bucket" "example_bucket2" {
  bucket = "tester-${var.tags["environment"]}-s3-bucket"
  tags   = var.tags
}
