/*resource "aws_security_group" "demo_sg" {
  name = "aws-sg"

  ingress {
    from_port   = 8200
    to_port     = 8200
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 8201
    to_port     = 8201
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 8300
    to_port     = 8300
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
}
*/
variable sg_ports {
  type = list(number)
  description = "Values for ingress ports"
  default = [8200,8201,8300,9000,9001]
}

resource "aws_security_group" "demo_sg" {
  name = "aws-sg"

  dynamic ingress {
    for_each = var.sg_ports
    content {
      from_port   = ingress.value
      to_port     = ingress.value
      protocol    = "tcp"
      cidr_blocks = ["0.0.0.0/0"]
    }
  }
}
