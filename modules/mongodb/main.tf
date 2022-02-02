# In DEV environment we use M0 cluster size to exploit MongoDB Atlas free tier
#provider "mongodbatlas" {
 # The authentication is using the following environment variables :
 #   MONGODB_ATLAS_PUBLIC_KEY
 #   MONGODB_ATLAS_PRIVATE_KEY
#}

resource "mongodbatlas_network_container" "atlas-container" {
  project_id       = "${local.project_id}"
  atlas_cidr_block = "192.168.0.0/16"
  provider_name    = "GCP"
  #regions = ["WESTERN_EUROPE"] # = EU_WEST_1
}

# data "mongodbatlas_network_container" "atlas-container" {
#     project_id   = "${local.project_id}"
#     container_id = "${var.container_id}"
# }

resource "mongodbatlas_network_peering" "atlas-peering" {
  project_id     = "${local.project_id}"
  #container_id   = "${data.mongodbatlas_network_container.atlas-container.container_id}"
  container_id   = "${var.container_id}"
  provider_name  = "GCP"
  gcp_project_id = "${var.gcp_project_id}"
  network_name   = "${var.network}"
}

resource "google_compute_network_peering" "gcp-peering" {
  name         = "terraform-${var.env}-peering"
  network      = "${var.network}"
  peer_network = "https://www.googleapis.com/compute/v1/projects/${resource.mongodbatlas_network_peering.atlas-peering.gcp_project_id}/global/networks/${resource.mongodbatlas_network_peering.atlas-peering.atlas_vpc_name}"
}

# resource "mongodbatlas_cluster" "cluster-test" {
#   project_id   = "${local.project_id}"
#   name         = "cluster-test"
#   cluster_type = "REPLICASET"
#   replication_specs {
#     num_shards = 1
#     regions_config {
#       region_name = var.region
#     }
#   }

#   //Provider Settings "block"
#   provider_name               = "GCP"
#   provider_instance_size_name = "M0"
# }