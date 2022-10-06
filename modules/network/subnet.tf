# resource "aws_subnet" "subnets" {
#   for_each                = var.subnets
#   vpc_id                  = aws_vpc.maciejgroszyk_tf_vpc.id
#   cidr_block              = each.value.cidr
#   availability_zone       = each.value.az
#   tags                    = each.value.tags
#   map_public_ip_on_launch = each.value.public_ip
# }

resource "aws_subnet" "subnets" {
  count = var.single_config == false ? 2:1
  vpc_id                  = aws_vpc.maciejgroszyk_tf_vpc.id
  cidr_block              = var.subnets[count.index]["cidr"]
  availability_zone       = var.subnets[count.index]["az"]
  tags                    = var.subnets[count.index]["tags"]
  map_public_ip_on_launch = var.subnets[count.index]["public_ip"]
}