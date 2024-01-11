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

# Define a local variable to store instance configuration
locals {
  instance_config = {
    ami                    = "ami-012a3e631057deaca"
    instance_type          = "t2.micro"
    key_name               = "capitaine23"
    vpc_security_group_ids = "sg-0dd9ef5e8e4f5602e"
    subnet_id              = "subnet-05ef0188469884b0d"
    volume_size            = "10"
    tags = {
      Name      = "BFA"
      Create_By = "Terraform"
    }
  }
}

# Create the AWS instance using the local variable
resource "aws_instance" "example" {
  ami                    = local.instance_config.ami
  instance_type          = local.instance_config.instance_type
  key_name               = local.instance_config.key_name
  vpc_security_group_ids = [local.instance_config.vpc_security_group_ids]
  subnet_id              = local.instance_config.subnet_id

  root_block_device {
    volume_size = local.instance_config.volume_size
  }

  tags = local.instance_config.tags
}
