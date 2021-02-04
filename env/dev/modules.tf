module "iam" {
  source = "../../modules"

  env = var.env
  service_accounts = {
    github = [
      "roles/artifactregistry.writer",
      "roles/container.developer",
      "roles/storage.admin"
    ],
  }
}