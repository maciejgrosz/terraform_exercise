# module "alb" {
#   source  = "terraform-aws-modules/alb/aws"
#   version = "~> 6.0"
#   name = "maciejgroszyk-alb"

#   load_balancer_type = "application"

#   vpc_id          = aws_vpc.maciejgroszyk_tf_vpc.id
#   subnets         = local.subnets_ids
#   security_groups = local.security_group_ids

#   target_groups = [
#     {
#       backend_protocol = "HTTP"
#       backend_port     = 80
#       target_type      = "instance"
#       targets = {
#         my_target = {
#           target_id = "${aws_instance.maciejgroszyk_tf_ec2["a"].id}"
#           port      = 8080
#         }
#         my_other_target = {
#           target_id = "${aws_instance.maciejgroszyk_tf_ec2["b"].id}"
#           port      = 8080
#         }
#       }
#     }
#   ]

#   http_tcp_listeners = [
#     {
#       port               = 80
#       protocol           = "HTTP"
#       target_group_index = 0
#     }
#   ]
# }

resource "aws_lb" "alb" {
  name               = "main-app-lb"
  load_balancer_type = "application"
  subnets            = local.subnets_ids
  security_groups    = local.security_group_ids
}

resource "aws_lb_listener" "alb" {
  load_balancer_arn = aws_lb.alb.arn
  port              = "80"
  protocol          = "HTTP"
}

resource "aws_lb_target_group" "mg-tf-target_group" {
  name     = "maciejgroszyk-tg-alb"
  port     = 80
  protocol = "HTTP"
  vpc_id   = aws_vpc.maciejgroszyk_tf_vpc.id

  health_check {
    port     = 80
    protocol = "HTTP"
    timeout  = 5
    interval = 10
  }
}

resource "aws_lb_target_group_attachment" "blue" {
  for_each         = var.aws_instances
  target_group_arn = aws_lb_target_group.mg-tf-target_group.arn
  target_id        = aws_instance.maciejgroszyk_tf_ec2[each.key].id
  port             = 8080
}
