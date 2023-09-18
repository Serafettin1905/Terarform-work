module "docker-instance-new" {
  source  = "Serafettin1905/docker-instance-new/aws"
  version = "0.0.1"
  # insert the 1 required variable here
  key_name = "second-key-pair"
}