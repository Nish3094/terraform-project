resource "aws_instance" "myec2" {
  ami           = "ami-830c94e3"
  instance_type = "t2.micro"
}
