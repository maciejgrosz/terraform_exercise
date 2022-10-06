variable "AWS_REGION" {
  default = "eu-west-2"
}

variable "aws_instances" {
  type = map(object({
    ami           = string
    instance_type = string
    start_script  = string
    tags          = map(any)
    key_name      = string
  }))
  description = "AWS instances"
}

variable "subnets" {
  type = map(object({
    cidr      = string
    az        = string
    tags      = map(any)
    public_ip = bool
  }))
}