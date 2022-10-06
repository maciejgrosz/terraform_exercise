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