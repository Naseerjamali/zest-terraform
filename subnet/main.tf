resource "google_compute_subnetwork" "subnet" {
  count        = length(var.subnet_configs)
  name         = var.subnet_configs[count.index].name
  ip_cidr_range = var.subnet_configs[count.index].cidr
  region       = var.region
  network      = var.vpc_id
}
