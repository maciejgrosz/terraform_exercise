subnets = {
  "a" = {
    cidr      = "10.0.0.0/24"
    az        = "eu-west-2a"
    public_ip = "true"
    tags = {
      Name = "maciejgroszyk_tf-public-subnet-1-eu-west-2b"
    }
  },
  "b" = {
    cidr      = "10.0.1.0/24"
    az        = "eu-west-2b"
    public_ip = "true"
    tags = {
      Name = "maciejgroszyk_tf-public-subnet-2-eu-west-2b"
    }
  }
}