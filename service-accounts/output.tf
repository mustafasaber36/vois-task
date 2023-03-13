output "bucket_service_account_email" {
  value = google_service_account.bucket_service_account.email
}
#============bigquery=========================
output "bigquery_service_account_email" {
  value = google_service_account.bigquery_service_account.email
}
