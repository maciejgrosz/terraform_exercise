resource "aws_instance" "maciejgroszyk_tf_ec2" {
  for_each      = toset(["maciejgroszyk_tf_ec2-1", "maciejgroszyk_tf_ec2-2"])
  ami           = "ami-0f540e9f488cfa27d"
  instance_type = "t2.micro"
  subnet_id     = aws_subnet.maciejgroszyk_tf-public-subnet-1.id
  tags = {
    Name       =  each.key
    created_by = "Maciej Groszyk"
    bootcamp   = "poland1"
  }
  user_data              = file("docker.sh")
  volume_tags            = var.volume_tags
  vpc_security_group_ids = [aws_security_group.mg_security_group_tf.id]
  key_name               = "londonmaciejgroszyk"
}
# resource "aws_instance" "maciejgroszyk_tf_ec2-2" {
#     ami           = "ami-0f540e9f488cfa27d"
#     instance_type = "t2.micro"
#     subnet_id = "${aws_subnet.maciejgroszyk_tf-public-subnet-1.id}"
#     tags = {
#         Name = "maciejgroszyk_tf_ec2-2"
#         created_by = "Maciej Groszyk"
#         bootcamp = "poland1"
#     }
#     user_data              = file("docker.sh")
#     volume_tags = var.volume_tags
#     vpc_security_group_ids = [aws_security_group.mg_security_group_tf.id]
#     key_name = "londonmaciejgroszyk"
# }