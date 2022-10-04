data "aws_subnet" "mg-subnet-public-1" {
    tags = {
        Name = "mg-subnet-public-1"
    }
}
