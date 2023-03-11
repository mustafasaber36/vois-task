#================Read_Write_Bigquery===================

resource "google_service_account" "bigquery_service_account" {
  account_id   = "bg-bastion-sa"
  display_name = "Bigquery Service Account"
}
resource "google_project_iam_member" "read_write_bigquery" {
  project = var.project_id
  role    = "roles/bigquery.dataEditor"
  member  = "serviceAccount:${google_service_account.bigquery_service_account.email}"
}
#================Read_only_Bucket=======================

resource "google_service_account" "bucket_service_account" {
  account_id   = "bucket-bastion-sa"
  display_name = "Bucket Service Account"
}
resource "google_project_iam_member" "read_only_bucket" {
  project = var.project_id
  role    = "roles/storage.objectViewer"
  member  = "serviceAccount:${google_service_account.bucket_service_account.email}"
}
