#====================VPC======================
resource "google_compute_network" "my_vpc" {
  name                    = var.vpc_name
  auto_create_subnetworks = false
}
#====================subnet===================
resource "google_compute_subnetwork" "my_subnet" {
  name          = var.subnet_name
  ip_cidr_range = var.subnet_cidr
  region        = var.region
  network       = google_compute_network.my_vpc.id
  private_ip_google_access = true
}
#===================firewall===================
resource "google_compute_firewall" "IAP-rule" {
  name          = "iap-rule"
  network       = google_compute_network.my_vpc.id
  description   = "allow only iap cidr range for vm"
  source_ranges = ["35.235.240.0/20"]
  direction     = "INGRESS"
  allow {
    protocol = "tcp"
    ports    = ["22"]
  }
  target_tags = ["bastion-machine"]
}