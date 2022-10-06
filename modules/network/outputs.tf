output "subnet_a_id" {
    description = "The id of the subnet a"
    value = aws_subnet.subnets["a"].id
}