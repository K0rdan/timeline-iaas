#!/usr/bin/env bash
ENV='dev'

while getopts 'e:' flag; do
  case "${flag}" in
    e|env) ENV=${OPTARG} ;;
    *) exit 1 ;;
  esac
done

echo "Setup project on '$ENV' plateform..."

#gcloud auth activate-service-account --key-file $GCLOUD_API_KEYFILE
#gcloud config set project ${GCLOUD_PROJECT}-${ENV}
#gcloud config set compute/zone ${GCLOUD_ZONE}
#gcloud auth configure-docker --quiet

#gcloud services enable cloudbuild.googleapis.com compute.googleapis.com iam.googleapis.com cloudresourcemanager.googleapis.com
# Lately for GKE configuration
# gcloud container clusters get-credentials ${GCLOUD_PROJECT}-${ENV}-cluster
