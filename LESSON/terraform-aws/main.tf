terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "5.14.0"
    }
  }
}

provider "aws" {
  # Configuration options
  region = "us-east-1"
}

resource "aws_instance" "sheldon-ec2" {
  ami           = "ami-022e1a32d3f742bd8"
  instance_type = "t2.micro"
  tags = {
    Name = "created-by-tf"
  }
}

resource "aws_s3_bucket" "sheldon-s3" {
    bucket = "sheldon-bucket-test"
  
}

