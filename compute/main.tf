resource "google_compute_address" "static-ip"{
  count   = length(var.instance_configs)
  name = "static-ip-${var.instance_configs[count.index].name}"
}


resource "google_compute_instance" "instance" {
  count        = length(var.instance_configs)
  name         = var.instance_configs[count.index].name
  machine_type = var.instance_configs[count.index].machine_type
  zone         = var.instance_configs[count.index].zone
  tags = var.instance_configs[count.index].tags
  labels = var.instance_configs[count.index].labels
  # tags = length([for tag_set in var.tag_sets : tag_set.tags if tag_set.instance_name == var.instance_configs[count.index].name]) > 0 ?
  #   [element([for tag_set in var.tag_sets : tag_set.tags if tag_set.instance_name == var.instance_configs[count.index].name], 0)] : []

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
  # tags = var.tags
}

#  depends_on = [
#     google_compute_subnetwork.subnet,  # Ensure subnets are created
#     google_compute_router_nat.nat      # Ensure NAT gateway is created
#   ]



