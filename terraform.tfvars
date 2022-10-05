subnets = {
  "a" = {
    cidr = "10.0.0.0/24"
    az   = "eu-west-2a"
    tags = {
      Name = "maciejgroszyk-public-subnet-${az}"
    }
  },
  "b" = {
    cidr = "10.0.1.0/24"
    az   = "eu-west-2b"
    tags = {
      Name = "maciejgroszyk-public-subnet-${az}"
    }
  }
}

aws_instances = {
  "a" = {
    ami           = "ami-0f540e9f488cfa27d"
    instance_type = "t2.micro"
    key_name      = "londonmaciejgroszyk"
    start_script  = "docker.sh"
    tags = {
      Name       = "maciejgroszyk_tf_ec2-1"
      created_by = "Maciej Groszyk"
      bootcamp   = "poland1"
    }
  },
  "b" = {
    ami           = "ami-0f540e9f488cfa27d"
    instance_type = "t2.micro"
    key_name      = "londonmaciejgroszyk"
    start_script  = "docker.sh"
    tags = {
      Name       = "maciejgroszyk_tf_ec2-2"
      created_by = "Maciej Groszyk"
      bootcamp   = "poland1"
    }
  }
}