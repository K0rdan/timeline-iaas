terraform {
  required_version = ">= 1.1"
  required_providers {
    tfe = {
      source  = "hashicorp/tfe"
      version = "~> 0.28.0"
    }
    google = {
      source  = "hashicorp/google"
      version = ">= 4.9.0"
    }
  }

  backend "remote" {
    hostname = "app.luos.io"
    # The name of your Terraform Cloud organization.
    organization = "luos.io"

    # The name of the Terraform Cloud workspace to store Terraform state files in.
    workspaces {
      prefix = "luos-"
    }
  }
}

provider "google" {
  project = local.project
  region  = var.region
  zone    = var.zone
}
resource "google_compute_network" "vpc_network" {
  name = "luos-${var.env}-network"
}