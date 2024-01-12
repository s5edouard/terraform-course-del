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

# Define a number variable for the count of instances
variable "example_number" {
  description = "Number of AWS instances to create"
  type        = number
  default     = 2 # You can change the default value as needed
}

resource "aws_instance" "example" {
  count = var.example_number # Use the variable to determine the number of instances

  ami                    = "ami-0256a0be1df3acd7d"
  instance_type          = "t2.micro"
  key_name               = "capitaine23"
  vpc_security_group_ids = ["sg-0dd9ef5e8e4f5602e"]
  subnet_id              = "subnet-05ef0188469884b0d"

  root_block_device {
    volume_size = "10"
  }

  tags = {
    Name      = "Capitaine-${count.index + 1}" # Create unique instance names
    Create_By = "Terraform"
  }
}

