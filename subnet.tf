resource "aws_subnet" "maciejgroszyk_tf-public-subnet-1" {
    vpc_id = "${aws_vpc.maciejgroszyk_tf_vpc.id}"
    map_public_ip_on_launch = "true"
    availability_zone = "eu-west-2a"
    tags = {
        Name = "maciejgroszyk_tf-public-subnet-1"
    }
}