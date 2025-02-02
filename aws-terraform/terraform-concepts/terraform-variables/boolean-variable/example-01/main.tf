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

variable "create_instance" {
  type    = bool
  default = true
}

resource "aws_instance" "example" {
  # Create one instance if create_instance is true, otherwise create none
  count = var.create_instance ? 1 : 0

  ami                    = "ami-0fc5d935ebf8bc3bc"
  instance_type          = "t2.micro"
  key_name               = "capitaine23"
  vpc_security_group_ids = ["sg-0dd9ef5e8e4f5602e"]
  subnet_id              = "subnet-05ef0188469884b0d"
  root_block_device {
    volume_size = "10"
  }

  tags = {
    Name      = "BFA"
    Create_By = "Terraform"
  }
}


