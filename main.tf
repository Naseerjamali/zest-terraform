module "vpc" {
  source   = "./vpc"
  vpc_name = var.vpc_name
}

module "subnet" {
  source         = "./subnet"
  vpc_id         = module.vpc.vpc_id
  region         = var.region
  subnet_configs = var.subnet_configs
}

module "nat_gateway" {
  source      = "./nat_gateway"
  vpc_id      = module.vpc.vpc_id
  region      = var.region
  router_name = var.router_name
  nat_name    = var.nat_name
}

# locals {
#   subnet_self_links = module.subnet.subnets
#   instance_configs_with_self_links = [
#     for instance in var.instance_configs : merge(
#       instance,
#       { subnet_self_link = local.subnet_self_links[instance.subnet] }
#     )
#   ]
# }

module "compute" {
  source           = "./compute"
  instance_configs = var.instance_configs


  depends_on = [
    module.subnet,     # Ensure subnets are created
    module.nat_gateway # Ensure NAT gateway is created
  ]

}

module "firewalls" {
  source    = "./firewalls"
  vpc_id    = module.vpc.vpc_id
  firewalls = var.firewalls
  # gcloudtags = var.tags
}

module "buckets" {
  source  = "./buckets"
  buckets = var.buckets
}