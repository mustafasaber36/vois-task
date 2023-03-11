resource "google_container_cluster" "my_gke" {
  name                     = "my-gke-cluster"
  location                 = var.gke-zone
  network                  = var.vpc_name
  subnetwork               = var.subnet_name
  remove_default_node_pool = true
  initial_node_count       = 1 
  master_authorized_networks_config {
    cidr_blocks {
      cidr_block = var.vm_private_ip
    }
  }
  ip_allocation_policy {}
  private_cluster_config {
    enable_private_endpoint = true
    enable_private_nodes    = true
    master_ipv4_cidr_block  = "172.16.0.32/28"
    master_global_access_config {
      enabled = false
    }
  }
  addons_config {
    http_load_balancing {
      disabled = false
    }
  }
}