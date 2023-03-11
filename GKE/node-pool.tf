resource "google_container_node_pool" "gke_nodes" {
  name       = "my-node-pool"
  location   = var.gke-zone
  cluster    = google_container_cluster.my_gke.id 
  node_count = 1
  node_locations = var.node_locations
  node_config {
    preemptible     = true
    machine_type    = "e2-standard-2"
    disk_size_gb    = 100
    disk_type       = "pd-standard"
    service_account = google_service_account.node-service-account.email
    oauth_scopes    = ["https://www.googleapis.com/auth/cloud-platform"]
  }
  upgrade_settings {
    max_surge       = 1
    max_unavailable = 0
  }
}