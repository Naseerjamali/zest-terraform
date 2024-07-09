output "subnets" {
  value = { for s in google_compute_subnetwork.subnet : s.name => s.self_link }
}

