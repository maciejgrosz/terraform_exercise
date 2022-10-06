# mention 2 modules, provide under compute module 
# something that forward to specific subnets

module "compute" {
    source = "./modules/compute"
}

module "network" {
    source = "./modules/network"
}
