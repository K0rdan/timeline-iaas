# Timeline IAAS

## Getting Started

You need to have in your path:

- [terraform](https://www.terraform.io/downloads.html) (>= 0.12)

```sh
$ terraform init -reconfigure env/$ENV
$ terraform apply env/$ENV
```

## Pre-requierements

Some modules need API to be activate on GCP.

- [Identity and Access Management (IAM)](https://console.developers.google.com/apis/api/iam.googleapis.com/overview?project=1057790429303) :
  For modifying roles :
  - [Cloud Resource Manager (CRM)](https://console.developers.google.com/apis/api/cloudresourcemanager.googleapis.com/overview?project=1057790429303)

## Providers

- For **all modules**, you need to have `gcloud` cli installed and configured with **admin access**.

## Variables

> Check `variables.tf` with default value only. The others will be prompt during apply.
> You can override it by changing default values, create `terraform.tfvars` or in cli `$ terraform apply -var="gcp_region=europe-west-1"`

| Variable   | Default       |
| ---------- | ------------- |
| gcp_region | europe-west-1 |
