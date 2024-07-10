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

# variable "instance_names" {
#   type = list(string)
#   default = ["instance-1-1", "instance-2-1"]
# }

# variable "tag_sets" {
#   type = list(object({
#     instance_name = string
#     tags          = list(string)
#   }))
#   default = [
#     {
#       instance_name = "instance1-1"
#       tags          = ["ssh-access", "http-server"]
#     },
#     {
#       instance_name = "instance2-1"
#       tags          = ["http-server"]
#     },
    # {
    #   instance_name = "instance3"
    #   tags          = ["https-server"]
    # },
#   ]
# }