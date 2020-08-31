terraform {
  required_version = ">= 0.13"
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