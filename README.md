# Luos IAAS

## Getting Started

### Local Setup

You need to have in your path:

- [gcloud](https://cloud.google.com/sdk/install?hl=fr) (>=370.0.0)
- [terraform](https://www.terraform.io/downloads.html) (>= 1.1.4)

```sh
$ terraform -chdir=env/$ENV init -reconfigure
$ terraform -chdir=env/$ENV plan
$ terraform -chdir=env/$ENV apply
```

Or :

- [act] (https://github.com/nektos/act) (>=0.2.18)

```sh
act -P ubuntu-latest=node:12.6 -e ./.act/inputs.json --secret-file ./.act/.secrets -j terraform
```

You can use the flags :

- `--insecure-secrets` to see in full text the value of the secrets in your local pipeline.
- `-v` to have the maximum verbosity of logs in your pipeline.

#### ACT's Secrets

Here's the template of secrets you have to use :

```env
TFC_WORKSPACE=
TFC_API_TOKEN=
GOOGLE_PROJECT_ID=
GOOGLE_CREDENTIALS=
MONGODB_ATLAS_PUBLIC_KEY=
MONGODB_ATLAS_PRIVATE_KEY=
```

### Github Setup

In your repository settings you'll to create the following environment (case **in**sensitive) :
| Environment | Trigram |
| ------------- | ------------- |
| Development | DEV |

Each environment must have the following environment secrets :
| Variable | Usage |
| -------- | ----- |
| GCP_PROJECT_ID | Used to `Setup GCloud` |
| GCP_SA_KEY | Used to `Setup GCloud` |

## Pre-requierements

Some modules need API to be activate on GCP :

- [Cloud Build]()
- [Compute Engine](https://console.developers.google.com/apis/library/compute.googleapis.com)
- [Identity and Access Management (IAM)](https://console.developers.google.com/apis/api/iam.googleapis.com/overview) :
- [Cloud Resource Manager (CRM)](https://console.developers.google.com/apis/api/cloudresourcemanager.googleapis.com/overview)

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
