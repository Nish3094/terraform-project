locals {
tags_list = {
  name = "Devops Team"
  Environment = "Dev"
}
}

data "aws_ami" "aminame" {
  most_recent = "true"
  owners = ["amazon"]

  filter {
    name = "name"
    values = ["amzn2-ami-hvm*"]
  }
}

resource "aws_instance" "myec2" {
  ami           = data.aws_ami.aminame.id
  instance_type = "t2.micro"
  tags = local.tags_list
}
