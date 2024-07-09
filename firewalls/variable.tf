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

variable "vpc_id" {
  description = "The ID of the VPC"
  type        = string
}
