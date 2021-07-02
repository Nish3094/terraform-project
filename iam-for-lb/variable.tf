variable "elb_names" {
 type = list
 default = ["staging-lb","production-lb","dev-lb"]
}

variable "vcount" {
  type = number
  default = "3"
}

variable "aws_access_key" {}
variable "aws_secret_key" {}
