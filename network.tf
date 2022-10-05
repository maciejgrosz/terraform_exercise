resource "aws_internet_gateway" "maciejgroszyk_tf_igw" {
  vpc_id = aws_vpc.maciejgroszyk_tf_vpc.id
  tags = var.internet_gateway_tags
}

resource "aws_route_table" "maciejgroszyk_tf_crt" {
  vpc_id = aws_vpc.maciejgroszyk_tf_vpc.id
  route {
    cidr_block = var.route_table["cidr"]
    gateway_id = aws_internet_gateway.maciejgroszyk_tf_igw.id
  }
  tags = {
    Name = "${var.route_table["Name"]}"
  }
}

resource "aws_route_table_association" "mg_crta_public_subnet_a" {
  subnet_id      = "${aws_subnet.subnets["a"].id}"
  route_table_id = aws_route_table.maciejgroszyk_tf_crt.id
}

resource "aws_route_table_association" "mg_crta_public_subnet_b" {
  subnet_id      = "${aws_subnet.subnets["b"].id}"
  route_table_id = aws_route_table.maciejgroszyk_tf_crt.id
}

resource "aws_security_group" "mg_security_group_tf" {
  vpc_id = aws_vpc.maciejgroszyk_tf_vpc.id

  egress {
    from_port   = var.security_group["egress_port1"]
    to_port     = var.security_group["egress_port1"]
    protocol    = var.security_group["egress_protocol"]
    cidr_blocks = [var.security_group["ip_0 "]]
  }
  ingress {
    from_port   = var.security_group["ingress_port1"]
    to_port     = var.security_group["ingress_port1"]
    protocol    = var.security_group["protocol_tcp"]
    cidr_blocks = [var.security_group["ip_0 "]]
  }
  ingress {
    from_port   = var.security_group["ingress_port2"]
    to_port     = var.security_group["ingress_port2"]
    protocol    = var.security_group["protocol_tcp"]
    cidr_blocks = [var.security_group["ip_0 "]]
  }
  ingress {
    from_port   = var.security_group["ingress_port3"]
    to_port     = var.security_group["ingress_port3"]
    protocol    = var.security_group["protocol_tcp"]
    cidr_blocks = [var.security_group["ip_0 "]]
  }
  tags = var.security_group["tags"]
}
