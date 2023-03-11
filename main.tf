provider "google" {
  project = "vois-project-379819"
  region  = var.region
}
#====================network==================
module "network" {
  source      = "./network"
  region      = var.region
  subnet_cidr = var.subnet_cidr
  subnet_name = var.subnet_name
  vpc_name    = var.vpc_name
}
#======================bastion================
module "bastion" {
  source  = "./bastion"
  vm_name = var.vm_name
  vm_type = var.vm_type
  vm_zone = var.vm_zone
  vm_os   = var.vm_os
  #this will gurantee the excution of the network module first then bastion
  vpc_name                       = module.network.vpc_name
  subnet_name                    = module.network.subnet_name
  bucket_service_account_email   = module.service-accounts.bucket_service_account_email
  bigquery_service_account_email = module.service-accounts.bigquery_service_account_email
}
#===========================gke===================
module "gke" {
  source         = "./GKE"
  gke-zone       = var.gke-zone
  vpc_name       = module.network.vpc_name
  subnet_name    = module.network.subnet_name
  vm_private_ip  = module.bastion.vm_private_ip
  node_locations = var.node_locations
}
#=====================bucket======================
module "buckets" {
  source          = "./buckets"
  bucket_name     = var.bucket_name
  bucket_location = var.bucket_location
  storage_class   = var.storage_class
}
#===================bigquery==================
module "bigquery" {
  source      = "./bigquery"
  bq_location = var.bq_location
  dataset_id  = var.dataset_id
  table_id    = var.table_id
}
#=======================Service-account==========

module "service-accounts" {
  source     = "./service-accounts"
  project_id = var.project_id
}
