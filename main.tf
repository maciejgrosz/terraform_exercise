# mention 2 modules, provide under compute module 
# something that forward to specific subnets

module "compute" {
    source = "./modules/compute"
    aws_instances = var.aws_instances
}

module "network" {
    source = "./modules/network"
}
