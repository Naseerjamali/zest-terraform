# IP address for NAT
resource "google_compute_address" "address" {
  name   = "nat-manual-ip"
  region = var.region
}

# Cloud Router for NAT
resource "google_compute_router" "nat_router" {
  name    = var.router_name
  network = var.vpc_id
  region  = var.region
}

# NAT Gateway
resource "google_compute_router_nat" "nat_gw" {
  name                     = var.nat_name
  router                   = google_compute_router.nat_router.name
  region                   = var.region
  nat_ip_allocate_option   = "MANUAL_ONLY"
  nat_ips                =   [google_compute_address.address.self_link]
 source_subnetwork_ip_ranges_to_nat = "LIST_OF_SUBNETWORKS"
  subnetwork {
    name                    = "private-subnet-1-1"
    source_ip_ranges_to_nat = ["ALL_IP_RANGES"]

  }

   subnetwork {
    name                    = "private-subnet-2-1"
    source_ip_ranges_to_nat = ["ALL_IP_RANGES"]

  }
 subnetwork {
    name                    = "private-subnet-3-1"
    source_ip_ranges_to_nat = ["ALL_IP_RANGES"]

  }

}