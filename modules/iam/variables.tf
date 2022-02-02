variable "region" {
  type    = string
  default = "europe-west1"
}

variable "zone" {
  type    = string
  default = "europe-west1-c"
}

variable "namespace" {
  type    = string
  default = "luos"
}

variable "service_accounts" {
  type = map(any)
  default = {
    github    = ["roles/storage.admin"]
  }
}

variable "env" {
  type    = string
  default = "dev"
}

/* LOCALS */

locals {
  project = "${var.namespace}-${var.env}"
  account_role_pairs = flatten([
    for account, roles in var.service_accounts : [
      for role in roles : {
        role    = role,
        account = account,
      }
    ]
  ])
}
