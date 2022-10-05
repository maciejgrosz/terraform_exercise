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
variable "ingress_cidr_blocks" {
  type    = list(string)
  default = ["0.0.0.0/0"]
}
variable "ingress_rules" {
  type    = list(string)
  default = ["22", "80", "8080"]
}
variable "egress_cidr_blocks" {
  type    = list(string)
  default = ["0.0.0.0/0"]
}

variable "egress_rules" {
  type    = list(string)
  default = ["0"]
}
variable "rules" {
  type = map(list(object({
    from_port = number,
    to_port   = number,
    protocol  = string,
  })))
  default = {
    "22"   = [22, 22, "tcp"]
    "80"   = [80, 80, "tcp"]
    "8080" = [8080, 8080, "tcp"]
    "0"    = [0, 0, "all"]
  }
}

# variable "security_group" {
#     type = object({
#         ip_0 = string
#         protocol_tcp = string
#         ingress_port1 = number
#         ingress_port2 = number
#         ingress_port3 = number
#         egress_port1 = number
#         egress_protocol = number
#         tag_name = string
#     })
#     default = {
#         ip_0 = "0.0.0.0/0"
#         protocol_tcp = "tcp" 
#         ingress_port1 = 22
#         ingress_port2 = 80
#         ingress_port3 = 8080
#         egress_port1 = 0
#         egress_protocol = -1
#         tag_name = "mg_security_group_tf"

#     }
# }   

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


