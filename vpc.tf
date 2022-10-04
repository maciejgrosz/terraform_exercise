resource "aws_vpc" "maciejgroszyk_tf_vpc" {
    cidr_block = "10.0.0.0/24"
    enable_dns_support = "true"
    enable_dns_hostnames = "true"
    enable_classiclink = "false"
    instance_tenancy = "default" 
    tags = {
        Name = "maciejgroszyk_tf_vpc"
    }
}