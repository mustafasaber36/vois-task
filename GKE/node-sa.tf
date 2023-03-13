resource "google_service_account" "node-service-account" {
  account_id   = "vois-project-379819"
  display_name = "Nodes Service Account"
}
resource "google_project_iam_member" "storageadmin" {
  project = "vois-project-379819"
  role    = "roles/storage.admin"
  member  = "serviceAccount:${google_service_account.node-service-account.email}"
}
# resource "google_project_iam_member" "containeradmin" {
#   project = "vois-project-379819"
#   role    = "roles/container.admin"
#   member  = "serviceAccount:${google_service_account.node-service-account.email}"
# }
