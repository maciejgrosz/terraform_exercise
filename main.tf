# mention 2 modules, provide under compute module 
# something that forward to specific subnets

module "compute" {
    source = "./modules/compute"
    aws_instances = var.aws_instances

    subnets_list = [module.network.subnet_a_id, module.network.subnet_b_id]
    vpc_id = module.network.vpc_id
}

module "network" {
    source = "./modules/network"

}
