variable "subnet_configs" {
  description = "A list of subnet configurations"
  type = list(object({
    name = string
    cidr = string
  }))
}

variable "vpc_id" {
  description = "The ID of the VPC"
  type        = string
}

variable "region" {
  description = "The region for the subnets"
  type        = string
}
