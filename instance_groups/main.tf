
resource "google_compute_instance_group" "webservers" {
  count = length(var.instance_groups)
  name        = var.instance_groups[count.index].name
  description = "Terraform test instance group"
  #instance_configs = var.instance_configs
  #instances= [module.compute.google_compute_instance.instance[count.index].name]
   instances = var.instances_id
   #[var.instances_id]
  #var.instances_id
#[match_keys(google_compute_instance.instance[count.index].id)]
 
#       #google_compute_instance.instance[count.index].id
#       #[for instance in google_compute_instance.instance : instance.name]
  

  named_port {
    name = "http"
    port = "8080"
  }

  named_port {
    name = "https"
    port = "8443"
  }

  zone = var.instance_groups[count.index].zone
}










# resource "google_compute_instance_group" "webservers" {
#   count = length(var.instance_groups)
#   name        = var.instance_groups[count.index].name
#   description = "Terraform test instance group"

#   instances = [
#       google_compute_instance.instances.id
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