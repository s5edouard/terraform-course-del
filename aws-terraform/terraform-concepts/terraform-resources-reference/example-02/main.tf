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

resource "aws_vpc" "example_vpc" {
  cidr_block = "10.0.0.0/16"
}

resource "aws_subnet" "example_subnet" {
  vpc_id     = aws_vpc.example_vpc.id
  cidr_block = "10.0.1.0/24"
}

resource "aws_instance" "example_instance" {
  ami           = "ami-0256a0be1df3acd7d"
  instance_type = "t2.micro"
  subnet_id     = aws_subnet.example_subnet.id
  key_name      = "capitaine23"
  root_block_device {
    volume_size = "10"
  }
  tags = {
    Name      = "capitaine"
    Create_By = "Terraform"
  }
  associate_public_ip_address = true  # Add this line to allocate a public IP
}

output "instance_public_ip" {
  description = "Public IP address of the EC2 instance"
  value = aws_instance.example_instance.public_ip
}

