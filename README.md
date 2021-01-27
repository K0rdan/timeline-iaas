# Timeline IAAS

## Getting Started

### Local Setup

You need to have in your path:

- [gcloud](https://cloud.google.com/sdk/install?hl=fr) (>=299.0.0)
- [terraform](https://www.terraform.io/downloads.html) (>= 0.12)



```sh
$ terraform init -reconfigure env/$ENV
$ terraform plan env/$ENV
$ terraform apply env/$ENV
```

### Github Setup
In your repository settings you'll to create the following environment (case **in**sensitive) :
| Environment   | Trigram       |
| ------------- | ------------- |
| Development | DEV |

Each environment must have the following environment secrets :
| Variable | Usage |
| -------- | ----- |
| GCP_PROJECT_ID | Used to `Setup GCloud` |
| GCP_SA_KEY | Used to `Setup GCloud` |

## Pre-requierements

Some modules need API to be activate on GCP :

- [Cloud Build]()
- [Compute Engine]()
- [Identity and Access Management (IAM)](https://console.developers.google.com/apis/api/iam.googleapis.com/overview?project=1057790429303) :
- [Cloud Resource Manager (CRM)](https://console.developers.google.com/apis/api/cloudresourcemanager.googleapis.com/overview?project=1057790429303)

You can enable these API with the following commands :

```
gcloud services enable cloudbuild.googleapis.com
gcloud services enable compute.googleapis.com
gcloud services enable iam.googleapis.com
gcloud services enable cloudresourcemanager.googleapis.com
```

Alternatively you can execute the scripts : `/scripts/init.sh`

## Providers

- For **all modules**, you need to have `gcloud` cli installed and configured with **admin access**.

## Variables

> Check `variables.tf` with default value only. The others will be prompt during apply.
> You can override it by changing default values, create `terraform.tfvars` or in cli `$ terraform apply -var="gcp_region=europe-west-1"`

| Variable   | Default       |
| ---------- | ------------- |
| gcp_region | europe-west-1 |
