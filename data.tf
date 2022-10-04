data "aws_subnet" "maciejgroszyk_tf_subnet" {
    tags = {
        Name = "maciejgroszyk_tf_subnet"
    }
}
