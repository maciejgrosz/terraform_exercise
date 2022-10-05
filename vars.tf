variable "AWS_REGION" {
  default = "eu-west-2"
}

variable "volume_tags" {
  type = map(any)
  default = {
    created_by = "Maciej Groszyk"
    bootcamp   = "poland1"
  }
}

variable "route_table" {
    type = map(any)
    default = {
        Name = "maciejgroszyk_tf_crt"
        cidr = "0.0.0.0/0"
    }
}

variable "internet_gateway_tags" {
    type = map(any)
    default = {
        Name = "maciejgroszyk_tf_igw"
    }
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
    cidr = string
    az   = string
    tags = map(any)
    public_ip = bool
  }))
}

# variable "alb" {
#     type = map

#     default= {
#         source="terraform-aws-modules/alb/aws"
#         version= "~> 6.0"
#         alb_name = "maciejgroszyk-alb"
#         load_balancer_type = "application"
#     }
# }

