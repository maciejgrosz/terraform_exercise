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

variable "aws_instances" {
  type = map(object({
    ami           = string
    instance_type = string
    tags          = map
    key_name      = string
  }))
  description = "AWS instances"
}

# variable "subnets" {
#   type = map(object({
#     cidr = string
#     az   = string
#     name = string
#   }))
# }