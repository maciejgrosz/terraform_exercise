resource "aws_instance" "maciejgroszyk_tf_ec2" {
  for_each               = var.aws_instances
  ami                    = each.value.ami
  instance_type          = each.value.instance_type
  subnet_id              = var.subnets_list[0]
  tags                   = each.value.tags
  user_data              = file(each.value.start_script)
  volume_tags            = var.volume_tags
  vpc_security_group_ids = [var.security_group_id]
  key_name               = each.value.key_name
}

 