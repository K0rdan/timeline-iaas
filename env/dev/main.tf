terraform {
  required_version = ">= 0.13"
  required_providers {
    tfe = {
      source  = "hashicorp/tfe"
      version = "~> 0.24.0"
    }
    google = {
      source  = "hashicorp/google"
      version = ">= 3.51.0"
    }
  }

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
  project = local.project
  region  = var.region
  zone    = var.zone
}
resource "google_compute_network" "vpc_network" {
  name = "terraform-network"
}