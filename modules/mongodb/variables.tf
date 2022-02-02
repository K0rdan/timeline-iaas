variable "region" {
  type    = string
  default = "europe-west1"
}

variable "env" {
  type    = string
  default = "dev"
}

variable "network" {
  type    = string
  default = "default"
}

variable "gcp_project_id" {
  type      = string
  sensitive = true
}

variable "container_id" {
  type      = string
  sensitive = true
  default   = "60d1b9e4f12bbf147f35a35e"
}

/* LOCALS */
locals {
  project_id = "60897f6b4e770e405d52cfac"
}