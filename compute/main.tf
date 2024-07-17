resource "google_compute_address" "static-ip"{
  count   = length(var.instance_configs)
  name = "static-ip-${var.instance_configs[count.index].name}"
}
resource "google_compute_disk" "compute_disk" {
  count = length(var.instance_configs)
  name  = var.instance_configs[count.index].name
  zone  = var.instance_configs[count.index].zone
  // only use an image data source if you're ok with the disk recreating itself with a new image periodically
  image = var.instance_configs[count.index].image
}

resource "google_compute_instance" "instance" {
  count        = length(var.instance_configs)
  name         = var.instance_configs[count.index].name
  machine_type = var.instance_configs[count.index].machine_type
  zone         = var.instance_configs[count.index].zone
  tags = var.instance_configs[count.index].tags
  labels = var.instance_configs[count.index].labels
  allow_stopping_for_update = true
  desired_status = var.instance_configs[count.index].desired_status
  # tags = length([for tag_set in var.tag_sets : tag_set.tags if tag_set.instance_name == var.instance_configs[count.index].name]) > 0 ?
  #   [element([for tag_set in var.tag_sets : tag_set.tags if tag_set.instance_name == var.instance_configs[count.index].name], 0)] : []

  boot_disk {
    source =  google_compute_disk.compute_disk[count.index].name
    auto_delete = false
    
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



# resource "google_compute_instance_group" "webservers" {
#   count = length(var.instance_groups)
#   name        = var.instance_groups[count.index].name
#   description = "Terraform test instance group"
#   #instance_configs = var.instance_configs
#   instances = [
#       google_compute_instance.instance[count.index].id
#       #[for instance in google_compute_instance.instance : instance.name]
#   ]

#   named_port {
#     name = "http"
#     port = "8080"
#   }

#   named_port {
#     name = "https"
#     port = "8443"
#   }

#   zone = var.instance_groups[count.index].zone
# }