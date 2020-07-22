FROM ubuntu:20.04
RUN apt-get update -y && \
  apt-get install --no-install-recommends -y \
    ca-certificates=20190110ubuntu1 \
    curl=7.68.0-1ubuntu2 \
    zip=3.0-11build1 \
    unzip=6.0-25ubuntu1 \
    tar=1.30+dfsg-7 && \
  rm -rf /var/cache/apt/*
RUN curl --silent --location -o ./terraform_0.12.26_linux_amd64.zip https://releases.hashicorp.com/terraform/0.12.26/terraform_0.12.26_linux_amd64.zip && \
  unzip terraform_0.12.26_linux_amd64.zip -d /usr/local/bin/ && \
  curl --silent --location -o /usr/local/bin/kubectl https://amazon-eks.s3.us-west-2.amazonaws.com/1.16.8/2020-04-16/bin/linux/amd64/kubectl && \
  chmod +x /usr/local/bin/kubectl && \
  curl --silent --location -o /usr/local/bin/aws-iam-authenticator https://amazon-eks.s3.us-west-2.amazonaws.com/1.16.8/2020-04-16/bin/linux/amd64/aws-iam-authenticator && \
  chmod +x /usr/local/bin/aws-iam-authenticator && \
  curl --silent --location -o ./helm-v2.14.3-linux-amd64.tar.gz https://get.helm.sh/helm-v3.2.1-linux-amd64.tar.gz && \
  tar -zxvf helm-v2.14.3-linux-amd64.tar.gz && \
  mv linux-amd64/helm /usr/local/bin/ && \
  curl --silent "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip" && \
  unzip awscliv2.zip && \
  /aws/install
