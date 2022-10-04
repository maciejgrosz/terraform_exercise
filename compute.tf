resource "aws_instance" "maciejgroszyk_tf_ec2" {
    ami           = "ami-0f540e9f488cfa27d"
    instance_type = "t2.micro"
    subnet_id = "${aws_subnet.maciejgroszyk_tf-public-subnet-1.id}"
    tags = {
    Name = "maciejgroszyk_tf_ec2"
    }
}