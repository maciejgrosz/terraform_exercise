resource "aws_subnet" "my_subnets" {
  for_each          = var.subnets
  vpc_id            = aws_vpc.maciejgroszyk_tf_vpc.id
  cidr_block        = each.value.cidr
  availability_zone = each.value.az
  tags              = each.value.tags
}