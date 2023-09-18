variable "ec2_name" {
  default = "sheldon-ec2"
}

variable "ec2_type" {
  default = "t2.micro"
}

variable "ec2_ami" {
  default = "ami-022e1a32d3f742bd8"

}

variable "s3_bucket_name" {
  default = "sheldon-s3-bucket-variable"

}