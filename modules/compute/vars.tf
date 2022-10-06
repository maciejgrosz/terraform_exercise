variable "volume_tags" {
  type = map(any)
  default = {
    created_by = "Maciej Groszyk"
    bootcamp   = "poland1"
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

variable "lb_name" {
  type    = string
  default = "maciejgroszyk-tf-alb"
}

variable "lb_type" {
  type    = string
  default = "application"
}

variable "alb_listener" {
  type = map(string)
  default = {
    port                = "80"
    protocol            = "HTTP"
    default_action_type = "forward"
  }
}

variable "mg_target_group" {
  type = any
  default = {
    name     = "maciejgroszyk-tg-alb"
    port     = 80
    protocol = "HTTP"
  }
}

variable "attach_port" {
  type    = number
  default = 8080
}

# ======= FROM OUTPUTS ======= #

variable "subnets_list" {
  type = list(string) 
}

variable "vpc_id" {
  type = string
}

variable "security_group_id" {
  type = string
}