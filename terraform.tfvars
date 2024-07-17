vpc_name    = "my-vpc-1"
region      = "asia-south1"
router_name = "my-router-1"
nat_name    = "my-nat-gateway-1"

subnet_configs = [
  {
    name = "public-subnet-1"
    cidr = "10.0.1.0/24"
  },
  {
    name = "private-subnet-1-1"
    cidr = "10.0.2.0/24"
  },
  {
    name = "private-subnet-2-1"
    cidr = "10.0.3.0/24"
  },
  {
    name = "private-subnet-3-1"
    cidr = "10.0.4.0/24"
  }
]

instance_configs = [
  {
    name           = "instance-1-1"
    machine_type   = "n1-standard-1"
    zone           = "asia-south1-a"
    image          = "projects/ubuntu-os-cloud/global/images/family/ubuntu-2004-lts"
    subnet         = "private-subnet-1-1"
    nat_ip         = ""
    tags           = ["ssh-vm"]
    desired_status = "RUNNING"
    labels         = { env = "qa" }

  },
  # Add 13 more instances as needed
  {
    name           = "instance-2-1"
    machine_type   = "n1-standard-1"
    zone           = "asia-south1-as
    "
    image          = "projects/ubuntu-os-cloud/global/images/family/ubuntu-2204-lts"
    subnet         = "private-subnet-1-1"
    nat_ip         = ""
    desired_status = "RUNNING"
    tags           = []
    labels         = { env = "prod" }
    # subnet       = module.subnet.subnets["private-subnet-1"]
  },
]

firewalls = [
  {
    name          = "allow-ssh-iap-1"
    direction     = "INGRESS"
    priority      = 1000
    protocol      = "tcp"
    ports         = ["22"]
    source_ranges = ["35.235.240.0/20"]
    #targets = []
    target_tags = []

  },
  {
    name          = "allow-lb-healthcheck-1"
    direction     = "INGRESS"
    priority      = 1000
    protocol      = "tcp"
    ports         = ["0-65535"]
    source_ranges = ["130.211.0.0/22", "35.191.0.0/16"]
    target_tags   = ["ssh-vm"]
    #targets = "Specified target tags"
  },
  # Add more rules as needed
]


buckets = {
  bucket1 = {
    name     = "asjdfoiajdsfidsa"
    location = "asia-south1"
    public   = true
  }
  bucket2 = {
    name     = "adsjfasdfadj"
    location = "asia-south1"
    public   = true
  }
  bucket3 = {
    name     = "ljljkjlkl"
    location = "asia-south1"
    public   = true
  }
  bucket4 = {
    name     = "iutoiewutoeut"
    location = "asia-south1"
    public   = true
  }
  bucket5 = {
    name     = "9j9j9j9"
    location = "asia-south1"
    public   = true
  }

  bucket6 = {
    name     = "r34r4r4r"
    location = "asia-south1"
    public   = true
  }

  bucket7 = {
    name     = "9387549875745jj"
    location = "asia-south1"
    public   = false
  }

  bucket8 = {
    name     = "jijiengirnn"
    location = "asia-south1"
    public   = false
  }

  bucket9 = {
    name     = "riewuroiureo"
    location = "asia-south1"
    public   = false
  }

  bucket10 = {
    name     = "mkmkoookn"
    location = "asia-south1"
    public   = false
  }

  bucket11 = {
    name     = "qwefefeee"
    location = "asia-south1"
    public   = false
  }

  bucket12 = {
    name     = "nkaienjgnei"
    location = "asia-south1"
    public   = false
  }

  bucket13 = {
    name     = "aalslseiekdkdgn"
    location = "asia-south1"
    public   = false
  }

  bucket14 = {
    name     = "qweruiop"
    location = "asia-south1"
    public   = false
  }

  bucket15 = {
    name     = "poiuqwer"
    location = "asia-south1"
    public   = false
  }

  bucket16 = {
    name     = "vnmczskjher"
    location = "asia-south1"
    public   = false

  }

  bucket17 = {
    name     = "aasdfjkllo"
    location = "asia-south1"
    public   = false
  }
}

instance_groups = [
  {
    name      = "my-instance-group-dummy"
    zone      = "asia-south1"
    #instance = "instance-1-1"

  },
  {
    name      = "my-instance-group-dummy2"
    zone      = "asia-south1"
    #instance = "instance-2-1"
  }

]


# buckets = [
#   {
#     name                        = "my-bucket-909"
#     location                    = "asia-south1"
#     storage_class               = "STANDARD"
#     uniform_bucket_level_access = false
#     role                        = "READER"
#     entity                      = "allUsers"
#     #object_name = "image1"
#     #content      = "<html><body>Hello World!</body></html>"
#     #source = "image1.jpg"

#   },

# ]