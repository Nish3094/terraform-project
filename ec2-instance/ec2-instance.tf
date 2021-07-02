locals {
tags_list = {
  name = "Devops Team"
  Environment = "Dev"
}
}

resource "aws_instance" "myec2" {
  ami           = "ami-830c94e3"
  instance_type = "t2.micro"
  tags = local.tags_list
}
