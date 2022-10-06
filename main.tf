# mention 2 modules, provide under compute module 
# something that forward to specific subnets

module "compute" {
  source        = "./modules/compute"
  aws_instances = var.aws_instances

  subnets_list          = module.network.subnets_list
  vpc_id                = module.network.vpc_id
  security_group_id     = module.network.security_group_id
  lb_name               = var.lb_name
  lb_type               = var.lb_type
  mg_target_group       = var.mg_target_group
  attach_port           = var.attach_port
  volume_tags           = var.volume_tags
  alb_listener          = var.alb_listener
  health_check_interval = var.health_check_interval
  health_check_timeout  = var.health_check_timeout
}

module "network" {
  source                = "./modules/network"
  subnets               = var.subnets
  tf_vpc                = var.tf_vpc
  route_table           = var.route_table
  ingress_cidr_blocks   = var.ingress_cidr_blocks
  ingress_rules         = var.ingress_rules
  egress_cidr_blocks    = var.egress_cidr_blocks
  internet_gateway_tags = var.internet_gateway_tags
  egress_rules          = var.egress_rule
  rules                 = var.rules
  security_group_tag    = var.security_group_tag
}
