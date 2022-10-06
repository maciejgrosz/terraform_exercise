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

variable "volume_tags" {
  type = map(any)
}

variable "lb_name" {
  type = string
}

variable "lb_type" {
  type = string
}

variable "alb_listener" {
  type = map(string)
}

variable "mg_target_group" {
  type = any
}

variable "attach_port" {
  type = number
}

variable "route_table" {
  type = map(any)
}

variable "internet_gateway_tags" {
  type = map(any)
}
variable "ingress_cidr_blocks" {
  type    = list(string)
}
variable "ingress_rules" {
  type    = list(string)
}
variable "egress_cidr_blocks" {
  type    = list(string)
}

variable "egress_rule" {
  type    = list(string)
}
variable "rules" {
  type = any
  #   type = map(list(object({
  #     from_port = number,
  #     to_port   = number,
  #     protocol  = string,
  #   })))
}

variable "security_group_tag" {
  type = map(any)
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
}
