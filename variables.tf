#=================network==========
variable "region" {
}
variable "subnet_cidr" {
}
variable "subnet_name" {
}
variable "vpc_name" {
}
#===============vm=============
variable "vm_name" {
}
variable "vm_type" {
}
variable "vm_zone" {
}
variable "vm_os" {
}
#=============gke===============
variable "gke-zone" {
  type = string
}
variable "node_locations" {
  type = list(any)
}
#=============bucket=============
variable "bucket_name" {
  type = string
}
variable "bucket_location" {
}
variable "storage_class" {
  default = "STANDARD"
}
#===============Big-query===================
variable "bq_location" {
}
variable "dataset_id" {
}
variable "table_id" {
}
#===================Service-account===========
variable "project_id" {
}
