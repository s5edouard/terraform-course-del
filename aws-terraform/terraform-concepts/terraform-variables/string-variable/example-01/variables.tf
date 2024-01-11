# Define string variables
variable "aws_region" {
  type        = string
  description = "AWS region for resources"
  default     = "us-east-2"
}

variable "ec2_instance_ami" {
  type        = string
  description = "AMI ID for the EC2 instance"
  default     = "ami-0256a0be1df3acd7d"
}

variable "ec2_instance_type" {
  type        = string
  description = "Instance type for the EC2 instance"
  default     = "t2.micro"
}

variable "ec2_instance_key_name" {
  type        = string
  description = "Name of the key pair for the EC2 instance"
  default     = "capitaine23"
}

variable "security_group_ids" {
  type        = list(string)
  description = "List of security group IDs for the EC2 instance"
  default     = ["sg-0dd9ef5e8e4f5602e"]
}

variable "subnet_id" {
  type        = string
  description = "Subnet ID for the EC2 instance"
  default     = "subnet-05ef0188469884b0d"
}

variable "root_volume_size" {
  type        = number
  description = "Size of the root volume for the EC2 instance"
  default     = 10
}

variable "bucket_suffix_length" {
  type        = number
  description = "Length of the random string used in the S3 bucket name"
  default     = 8
}

variable "bucket_suffix_special" {
  type        = bool
  description = "Include special characters in the random string for the S3 bucket name"
  default     = false
}

variable "bucket_suffix_upper" {
  type        = bool
  description = "Include uppercase letters in the random string for the S3 bucket name"
  default     = false
}

variable "bucket_suffix_number" {
  type        = bool
  description = "Include numbers in the random string for the S3 bucket name"
  default     = false
}
