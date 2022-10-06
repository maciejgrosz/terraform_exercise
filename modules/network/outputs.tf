output "subnet_a_id" {
    description = "The id of the subnet a"
    value = aws_subnet.subnets["a"].id
}

output "subnet_b_id" {
    description = "The id of the subnet b"
    value = aws_subnet.subnets["b"].id
}

output "vpc_id" {
    description = "The id of the VPC"
    value = aws_vpc.maciejgroszyk_tf_vpc.id
}   