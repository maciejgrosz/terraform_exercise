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
  type = any
  #   type = map(list(object({
  #     from_port = number,
  #     to_port   = number,
  #     protocol  = string,
  #   })))
  default = {
    "22"   = [22, 22, "tcp"]
    "80"   = [80, 80, "tcp"]
    "8080" = [8080, 8080, "tcp"]
    "0"    = [0, 0, "all"]
  }
}

variable "security_group_tag" {
  type = map(any)
  default = {
    Name = "mg_security_group_tf"
  }
}
variable "subnets" {
  type = map(object({
    cidr      = string
    az        = string
    tags      = map(any)
    public_ip = bool
  }))
}

variable "tf_vpc" {
  type = any
  default = {
    cidr_block           = "10.0.0.0/16"
    enable_dns_support   = "true"
    enable_dns_hostnames = "true"
    instance_tenancy     = "default"
    tags = {
      Name = "maciejgroszyk_tf_vpc"
    }
  }
}
