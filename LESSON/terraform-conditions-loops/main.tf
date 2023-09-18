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
}

variable "num_of_buckets" {
  default = 2
}

variable "s3_bucket_name" {
  default     = "sheldon-new-s3-bucket-test"
}

resource "aws_s3_bucket" "tf-s3" {
  # bucket = "${var.s3_bucket_name}-${count.index + 4}" # +4 dörtten başlayarak isim verir

  # count = var.num_of_buckets
  # count = var.num_of_buckets != 0 ? var.num_of_buckets : 3
   for_each = toset(var.users)
   bucket = "sheldon-tf-s3-bucket-${each.value}"
}


variable "users" {
  default = ["santino", "michael", "fredo"]
}

resource "aws_iam_user" "new_users" {
    for_each = toset(var.users)
    name = each.value
}

output "upercase_users" {
    value = [for user in var.users : upper(user)]
  
}