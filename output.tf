
output "aws_elb_hostname" {
  value = "${aws_elb.jiffle_elb.dns_name}"
}

