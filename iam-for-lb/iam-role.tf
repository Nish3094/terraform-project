resource aws_iam_user "lb" {
    name = var.elb_names[count.index]
    count = var.vcount
    path = "/system/"
}
