resource "google_compute_network" "auto_vpc_network" {
  name                    = "auto-vpc-tf"
  auto_create_subnetworks = true
}

resource "google_compute_network" "custom_vpc_network" {
  name                    = "custom-vpc-tf"
  auto_create_subnetworks = false
}

resource "google_compute_subnetwork" "subnetwork-sg" {
  name                     = "sg-subnetwork-tf"
  ip_cidr_range            = "10.2.0.0/16"
  region                   = "asia-southeast1"
  network                  = google_compute_network.custom_vpc_network.id
  private_ip_google_access = true
}


resource "google_compute_firewall" "custom-fw-sg-tf" {
  name    = "terraform-web-firewall-sg"
  network = google_compute_network.custom_vpc_network.id

  allow {
    protocol = "icmp"
  }

  allow {
    protocol = "tcp"
    ports    = ["80", "8080", "1000-2000", "22"]
  }

  source_tags   = ["terrafrom", "web"]
  source_ranges = ["0.0.0.0/0"]
}

output "auto" {
  value = google_compute_network.auto_vpc_network.id
}


output "custom" {
  value = google_compute_network.custom_vpc_network.id
}
