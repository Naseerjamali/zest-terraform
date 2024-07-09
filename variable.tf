variable "vpc_name" {
  description = "The name of the VPC network"
  type        = string
}

variable "region" {
  description = "The region for the resources"
  type        = string
}

variable "router_name" {
  description = "The name of the router"
  type        = string
}

variable "nat_name" {
  description = "The name of the NAT gateway"
  type        = string
}

variable "subnet_configs" {
  description = "A list of subnet configurations"
  type = list(object({
    name = string
    cidr = string
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
  }))
}

variable "firewalls" {
  description = "A list of firewall rules"
  type = list(object({
    name          = string
    direction     = string
    priority      = number
    protocol      = string
    ports         = list(string)
    source_ranges = list(string)
  }))
}