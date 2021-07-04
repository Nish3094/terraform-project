terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 3.0"
    }
  }
}

provider "aws" {
  secret_key = "XXXX-XXXX-XXXX-XXXX"
  access_key = "XXXX-XXXX-XXXX-XXXX"
  region     = "us-west-2"
}


resource "aws_instance" "myec2" {
  ami           = "ami-0721c9af7b9b75114"
  instance_type = "t2.micro"
  key_name      = "terraform"

  provisioner "remote-exec" {
    inline = [
      "sudo amazon-linux-extras install -y nginx1.12",
      "sudo systemctl start nginx"
    ]

    connection {
      type        = "ssh"
      user        = "ec2-user"
      private_key = file("./terraform.pem")
      host        = self.public_ip
    }
  }
}

