variable "instance_configs" {
  description = "A list of instance configurations"
  type = list(object({
    name         = string
    machine_type = string
    zone         = string
    image        = string
    subnet       = string
    nat_ip       = string
    # subnet_self_link = string
  }))
}

# variable "static_ip_name" {
#   type = string
#   name = "static-ip"
# }
# variable "subnets" {
#   description = "List of subnets"
#   type        = list(string)
# }