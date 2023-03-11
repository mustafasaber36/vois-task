resource "google_storage_bucket" "vois-task-bucket" {
  count = 3
  name  = "${var.bucket_name}-${count.index}"
  storage_class = var.storage_class
  location = var.bucket_location
}