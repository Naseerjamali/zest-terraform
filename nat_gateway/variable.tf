variable "router_name" {
  description = "The name of the router"
  type        = string
}

variable "nat_name" {
  description = "The name of the NAT gateway"
  type        = string
}

variable "vpc_id" {
  description = "The ID of the VPC"
  type        = string
}

variable "region" {
  description = "The region for the NAT gateway"
  type        = string
}
