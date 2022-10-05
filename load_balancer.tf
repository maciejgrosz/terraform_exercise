module "alb" {
  source  = "terraform-aws-modules/alb/aws"
  version = "~> 6.0"
  name = "maciejgroszyk-alb"

  load_balancer_type = "application"

  vpc_id          = aws_vpc.maciejgroszyk_tf_vpc.id
  subnets         = local.subnets_ids
  security_groups = local.security_group_ids

  target_groups = [
    {
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

  http_tcp_listeners = [
    {
      port               = 80
      protocol           = "HTTP"
      target_group_index = 0
    }
  ]
}