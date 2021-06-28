resource "aws_instance" "aws_ec2_instance" {
  ami           = "ami-830c94e3"
  instance_type = "t2.micro"

  tags = {
    name = "Example Instance"
  }
}