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

variable "security_group" {
    type = map(any)
    default = {
        cidr_blocks = ["0.0.0.0/0"]
        protocol_tcp = "tcp" 
        ingress_port1 = 22
        ingress_port2 = 80
        ingress_port3 = 8080
        egress_port1 = 0
        egress_protocol = -1
        tags = {
            Name = "mg_security_group_tf"
        }
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

