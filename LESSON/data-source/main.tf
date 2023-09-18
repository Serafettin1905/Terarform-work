provider "aws" {
  region  = "us-east-1"
}

terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = "5.13.1"
    }
  }
   backend "s3" {
    bucket = "sheldon-tf-remote-s3-backend"
    key = "env/dev/tf-remote-backend.tfstate"
    region = "us-east-1"
    dynamodb_table = "tf-s3-app-lock"
    encrypt = true
  }
}

locals {
  mytag = "sheldon"
}

data "aws_ami" "tf_ami" {
  most_recent      = true
  owners           = ["self"]

  filter {
    name = "virtualization-type"
    values = ["hvm"]
  }
}

variable "ec2_type" {
  default = "t2.micro"
}

resource "aws_instance" "tf-ec2" {
  ami           = data.aws_ami.tf_ami.id
  instance_type = var.ec2_type
  key_name      = "second-key-pair"
  tags = {
    Name = "${local.mytag}-this is from my-ami"
  }
}

resource "aws_s3_bucket" "tf-test-1" {
  bucket = "clarusway-test-1-versioning-sheldon"
}

resource "aws_s3_bucket" "tf-test-2" {
  bucket = "clarusway-test-2-versioning-sheldon"
}