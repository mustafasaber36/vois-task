#passing these arguments from network module to bastion module

output "subnet_name" {
  value = google_compute_subnetwork.my_subnet.name
}
output "vpc_name" {
  value = google_compute_network.my_vpc.name
}
output "subnet_cidr" {
  value = google_compute_subnetwork.my_subnet.id
}
