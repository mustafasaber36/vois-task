resource "google_bigquery_dataset" "my_dataset" {
    count = 3
    dataset_id                  = "${var.dataset_id}_${count.index}"
    # dataset_id                  = "vois-task-dataset"
    location                    = var.bq_location
}
resource "google_bigquery_table" "my_table" {
    dataset_id         = google_bigquery_dataset.my_dataset[count.index].dataset_id
    # table_id   = "table-vois-task"
    count = 3
    table_id           = "${var.table_id}_${count.index}"
}