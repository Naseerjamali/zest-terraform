vpc_name    = "my-vpc"
region      = "us-central1"
router_name = "my-router"
nat_name    = "my-nat-gateway"

subnet_configs = [
  {
    name = "public-subnet"
    cidr = "10.0.1.0/24"
  },
  {
    name = "private-subnet-1"
    cidr = "10.0.2.0/24"
  },
  {
    name = "private-subnet-2"
    cidr = "10.0.3.0/24"
  },
  {
    name = "private-subnet-3"
    cidr = "10.0.4.0/24"
  }
]

instance_configs = [
  {
    name         = "instance-1"
    machine_type = "n1-standard-1"
    zone         = "us-central1-a"
    image        = "projects/ubuntu-os-cloud/global/images/family/ubuntu-2004-lts"
    subnet       = "private-subnet-1"
    nat_ip       = "0.0.0.0"
    # subnet       = module.subnet.subnets["private-subnet-1"]
  },
  # Add 13 more instances as needed
  {
    name         = "instance-2"
    machine_type = "n1-standard-1"
    zone         = "us-central1-a"
    image        = "projects/ubuntu-os-cloud/global/images/family/ubuntu-2004-lts"
    subnet       = "private-subnet-1"
    nat_ip       = "8.8.8.8"
    # subnet       = module.subnet.subnets["private-subnet-1"]
  },
]

firewalls = [
  {
    name          = "allow-ssh-iap"
    direction     = "INGRESS"
    priority      = 1000
    protocol      = "tcp"
    ports         = ["22"]
    source_ranges = ["35.235.240.0/20"]
  },
  {
    name          = "allow-lb-healthcheck"
    direction     = "INGRESS"
    priority      = 1000
    protocol      = "tcp"
    ports         = ["0-65535"]
    source_ranges = ["130.211.0.0/22", "35.191.0.0/16"]
  },
  # Add more rules as needed
]