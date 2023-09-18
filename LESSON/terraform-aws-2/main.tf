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

locals {
  mytag = "sheldon-local-name"
}

resource "aws_instance" "sheldon-ec2" {
  ami           = var.ec2_ami
  instance_type = var.ec2_type
  key_name      = "second-key-pair"
  tags = {
    Name = "${local.mytag}-come from locals"
  }
}

resource "aws_s3_bucket" "sheldon-s3" {
  bucket = "${local.mytag}-come-from-locals"
}

output "tf_example_public_ip" {
  value = aws_instance.sheldon-ec2.public_ip
}

output "tf_example_s3_meta" {
  value = aws_s3_bucket.sheldon-s3.region
}