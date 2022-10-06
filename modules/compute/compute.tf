# resource "aws_instance" "maciejgroszyk_tf_ec2" {
#   for_each               = var.aws_instances
#   count                  = 2
#   ami                    = each.value.ami
#   instance_type          = each.value.instance_type
#   subnet_id              = var.subnets_list[0]
#   tags                   = each.value.tags
#   user_data              = file(each.value.start_script)
#   volume_tags            = var.volume_tags
#   vpc_security_group_ids = [var.security_group_id]
#   key_name               = each.value.key_name
# }

resource "aws_instance" "maciejgroszyk_tf_ec2" {
  count                  = 2
  ami                    = var.aws_instance["ami"]
  instance_type          = var.aws_instance["instance_type"]
  subnet_id              = var.subnets_list[0]
  tags                   = var.aws_instance["tags"]
  user_data              = file(var.aws_instance["start_script"])
  volume_tags            = var.volume_tags
  vpc_security_group_ids = [var.security_group_id]
  key_name               = var.aws_instance["key_name"]
}
 