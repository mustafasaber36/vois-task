#================network=============
region      = "us-central1"
subnet_cidr = "10.0.1.0/24"
subnet_name = "my-subnet"
vpc_name    = "my-vpc"
#===============--vm--===============
vm_name = "bastion"
vm_type = "e2-medium"
vm_zone = "us-central1-b"
vm_os   = "debian-cloud/debian-11"

#===============gke===================
gke-zone       = "us-central1-c"
node_locations = ["us-central1-f", "us-central1-c"]

#==============bucket==================
bucket_name     = "vois-task-bucket"
bucket_location = "us-central1"
storage_class   = "STANDARD"
#============big-query================

bq_location = "us-central1"
dataset_id  = "voistaskdataset"
table_id    = "voistasktable"
#============Service-account===========
project_id = "vois-project-379819"



