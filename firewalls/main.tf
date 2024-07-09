resource "google_compute_firewall" "firewall_rule" {
  count    = length(var.firewalls)
  name     = var.firewalls[count.index].name
  network  = var.vpc_id
  direction = var.firewalls[count.index].direction
  priority  = var.firewalls[count.index].priority

  allow {
    protocol = var.firewalls[count.index].protocol
    ports    = var.firewalls[count.index].ports
  }

  source_ranges = var.firewalls[count.index].source_ranges
}
