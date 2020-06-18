# Cloud CI Docker Image

![Docker Image Build](https://github.com/mediagrif/cloud-ci/workflows/Docker%20Image%20Build/badge.svg)

Initially created to run the [terraform-aws-eks](https://github.com/terraform-aws-modules/terraform-aws-eks) in the context of a CI/CD Pipeline, this image contains a curated list of binaries and applications useful for deploying and maintaining cloud infrastructure.

## Setup and Prerequisites

- Have [Docker](https://docs.docker.com/install/) installed locally

## Dependencies

- This image is built using the stable version of the [Ubuntu](https://hub.docker.com/_/ubuntu) image as a base.
- This image also includes compiled binaries for:
  - [Terraform](https://github.com/hashicorp/terraform)
  - [AWS' distribution of Kubectl](https://github.com/actions/aws/tree/master/kubectl)
  - [aws-iam-authenticator](https://github.com/kubernetes-sigs/aws-iam-authenticator)
  - [Helm](https://github.com/helm/helm)
  - [aws cli](https://aws.amazon.com/cli/)
