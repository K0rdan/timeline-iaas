module "iam" {
  source = "../../modules/iam"

  env = var.env
  service_accounts = {
    github = [
      "roles/artifactregistry.writer",
      "roles/container.developer",
      "roles/storage.admin"
    ],
  }
}

module "mongodb" {
  source         = "../../modules/mongodb"
  region         = var.region
  env            = var.env
  network        = resource.google_compute_network.vpc_network.id
  gcp_project_id = local.project
}