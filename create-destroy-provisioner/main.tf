resource "aws_security_group" "sg" {
  name        = "sg"
  description = "Allow ssh inbound traffic"

  ingress {
    description = "ssh from VPC"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 65535
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }


}

resource "aws_instance" "myec2" {
  ami                    = "ami-0d6621c01e8c2de2c"
  instance_type          = "t2.micro"
  key_name               = "terraform"
  vpc_security_group_ids = [aws_security_group.sg.id]


  provisioner "remote-exec" {

    inline = [

      "sudo yum install -y nano"
    ]
  }

  provisioner "remote-exec" {

    when = destroy
    inline = [

      "sudo yum remove -y nano"
    ]

  }

  connection {
    type        = "ssh"
    user        = "ec2-user"
    private_key = file("./terraform.pem")
    host        = self.public_ip

  }

}
