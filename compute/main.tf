resource "google_compute_address" "static-ip"{
  count   = length(var.instance_configs)
  name = "static-ip-${var.instance_configs[count.index].name}"
}


resource "google_compute_instance" "instance" {
  count        = length(var.instance_configs)
  name         = var.instance_configs[count.index].name
  machine_type = var.instance_configs[count.index].machine_type
  zone         = var.instance_configs[count.index].zone
  
  boot_disk {
    initialize_params {
      image = var.instance_configs[count.index].image
    }
  }
  
  network_interface {
    subnetwork = var.instance_configs[count.index].subnet
    # Ensure no public IP is assigned
    access_config {
      nat_ip = google_compute_address.static-ip[count.index].address
    }

  }
}

#  depends_on = [
#     google_compute_subnetwork.subnet,  # Ensure subnets are created
#     google_compute_router_nat.nat      # Ensure NAT gateway is created
#   ]



