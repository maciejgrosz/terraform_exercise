module "alb" {
  source  = "terraform-aws-modules/alb/aws"
  version = "~> 6.0"

  name = "maciejgroszyk-alb"

  load_balancer_type = "application"

  vpc_id          = aws_vpc.maciejgroszyk_tf_vpc.id
  subnets         = ["${aws_subnet.maciejgroszyk_tf-public-subnet-1.id}", "${aws_subnet.maciejgroszyk_tf-public-subnet-2.id}"]
  security_groups = ["${aws_security_group.mg_security_group_tf.id}"]

  #   access_logs = {
  #     bucket = "my-alb-logs"
  #   }

  target_groups = [
    {
      #   name_prefix      = "pref-"
      backend_protocol = "HTTP"
      backend_port     = 80
      target_type      = "instance"
      targets = {
        my_target = {
          target_id = "${aws_instance.maciejgroszyk_tf_ec2["a"].id}"
          port      = 8080
        }
        my_other_target = {
          target_id = "${aws_instance.maciejgroszyk_tf_ec2["b"].id}"
          port      = 8080
        }
      }
    }
  ]

  #   https_listeners = [
  #     {
  #       port               = 443
  #       protocol           = "HTTPS"
  #       certificate_arn    = "arn:aws:iam::123456789012:server-certificate/test_cert-123456789012"
  #       target_group_index = 0
  #     }
  #   ]

  http_tcp_listeners = [
    {
      port               = 80
      protocol           = "HTTP"
      target_group_index = 0
    }
  ]

  tags = {
    Environment = "Test"
  }
}