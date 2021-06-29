resource "aws_eip" "eip_gen" {
  vpc = "true"
}

resource "aws_eip_association" "eip_ec2_assoc" {
  instance_id   = aws_instance.myec2.id
  allocation_id = aws_eip.eip_gen.id
}
