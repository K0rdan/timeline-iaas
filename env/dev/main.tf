terraform {
  required_version = ">= 0.13"

  backend "remote" {
    # The name of your Terraform Cloud organization.
    organization = "Timeline"

    # The name of the Terraform Cloud workspace to store Terraform state files in.
    workspaces {
      name = "timeline-iaas"
    }
  }
}

provider "google" {
  version = "3.23.0"

  credentials = file("./secrets/timeline-dev-280507-eea2c31b6ec3.json")

  project = local.project
  region  = var.region
  zone    = var.zone
}

resource "google_compute_network" "vpc_network" {
  name    = "terraform-network"
}