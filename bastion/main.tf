resource "google_compute_instance" "instance" {
  name         = var.vm_name
  machine_type = var.vm_type
  zone         = var.vm_zone
  tags         = ["bastion-machine"]
  allow_stopping_for_update = true

  service_account {
    email  = var.bucket_service_account_email
    # email  = var.bigquery_service_account_email
    scopes = ["cloud-platform"]
  }
  boot_disk {
    initialize_params {
      image = var.vm_os
    }
    }
  network_interface {
    network    = var.vpc_name
    subnetwork = var.subnet_name
  }
  }
  