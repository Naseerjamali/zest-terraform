variable "instance_groups" {
    description = "A list of instance groups"
    type = list(object({
    name = string
    zone = string
    # instance = string
    }))
}

variable "instance_configs" {
  description = "A list of instance configurations"
  type = list(object({
    name         = string
    machine_type = string
    zone         = string
    image        = string
    subnet       = string
    nat_ip       = string
    tags = list(string)
    labels = map(string)
    desired_status = string
    # subnet_self_link = string
  }))
}

variable "instances_id"{
    type = list(string)
}

# variable "instances_id2"{
#   type = string
# }

# variable "instance" {
#   type = string
# }