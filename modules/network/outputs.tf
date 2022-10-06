output "subnet_a_id" {
    description = "The id of the subnet a"
    value = aws_subnet.subnets["a"].id
}

output "vpc_id" {
    description = "The id of the VPC"
    value = aws_vpc.maciejgroszyk_tf_vpc.id
}   