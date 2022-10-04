resource "aws_instance" "maciejgroszyk_tf_ec2" {
    ami           = "ami-0f540e9f488cfa27d"
    instance_type = "t2.micro"
    subnet_id = "${aws_subnet.maciejgroszyk_tf-public-subnet-1.id}"
    tags = {
        Name = "maciejgroszyk_tf_ec2"
        created_by = "Maciej Groszyk"
        bootcamp = "poland1"
    }

    volume_tags = {
        created_by = "Maciej Groszyk"
        bootcamp = "poland1"
    }
}

resource "aws_key_pair" "london-region-key-pair" {
    key_name = "londonmaciejgroszyk-terraform"
    public_key = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABgQCi5kDWZ2TN6OGHrKgREGD06va4/bAYsl77wmH64OSa+L5udnrymdeZccO8pXPMICyvMykqefI/7wIWBRnx/+a6LuPUxTx+nfFwcEgvh8vcEOyqgVlS+GF7+2VVbLXUDyA0LKEtYi88zCLfUSGAyN0uokPXpQRdCCMrLV9H44xj7c3dw7OtlokRoTIt89ahkmoOuo4rcZjYzYiKPVHdPyFemF6NpiD47VTohWBtUd1vzJvK8UGe30g1xIB47HaLMYIa4Px04REOnUFzE9sJYDzuTuf5TgZMD4eBJRos7FYCzlqDC2d3Af+Pw1NxYl8+QDoHOILa/skxH0MGiVfoQdeneOIlimhsYu+colSkB8X7+H86WvIje4ShSH4RGpBUWp+5v7aUhAmic1oLXF1iz9jWg7T1cShQQ8+Z95jUDihF9/Tcf+f3HjRAnYmpA1VLgRQf1adhOXSkh2h+klHfaRGak6uXBDZyKN16UZH+uIKR53J9+BF2k0BjSrRoo/e7o6E="
}