FROM ubuntu:20.04
RUN apt-get update -y && \
  apt-get install --no-install-recommends -y \
    ca-certificates=20190110ubuntu1 \
    curl=7.68.0-1ubuntu2.2 \
    zip=3.0-11build1 \
    unzip=6.0-25ubuntu1 \
    tar=1.30+dfsg-7 \
    python3.8=3.8.2-1ubuntu1.2 \
    docker.io=19.03.8-0ubuntu1 && \
  rm -rf /var/cache/apt/*
RUN curl --silent --location -o ./terraform_0.12.28_linux_amd64.zip https://releases.hashicorp.com/terraform/0.12.28/terraform_0.12.28_linux_amd64.zip && \
  unzip terraform_0.12.28_linux_amd64.zip -d /usr/local/bin/ && \
  curl --silent --location -o /usr/local/bin/kubectl https://amazon-eks.s3.us-west-2.amazonaws.com/1.16.8/2020-04-16/bin/linux/amd64/kubectl && \
  chmod +x /usr/local/bin/kubectl && \
  curl --silent --location -o /usr/local/bin/aws-iam-authenticator https://amazon-eks.s3.us-west-2.amazonaws.com/1.16.8/2020-04-16/bin/linux/amd64/aws-iam-authenticator && \
  chmod +x /usr/local/bin/aws-iam-authenticator && \
  curl --silent --location -o ./helm-v3.2.1-linux-amd64.tar.gz https://get.helm.sh/helm-v3.2.1-linux-amd64.tar.gz && \
  tar -zxvf helm-v3.2.1-linux-amd64.tar.gz && \
  mv linux-amd64/helm /usr/local/bin/ && \
  curl --silent "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip" && \
  unzip awscliv2.zip && \
  /aws/install && \
  # Install Java
  mkdir -p /usr/local/jdk11 && \
  curl --silent --location -o /tmp/jdk11.tar.gz https://corretto.aws/downloads/latest/amazon-corretto-11-x64-linux-jdk.tar.gz && \
  tar -xzf /tmp/jdk11.tar.gz -C /usr/local/jdk11 --strip-components=1 && \
  rm -f /tmp/jdk11.tar.gz && \
  # Install Maven 3.6.2
  mkdir -p /usr/local/maven /usr/local/maven/ref && \
  curl --silent --location -o /tmp/apache-maven.tar.gz https://apache.osuosl.org/maven/maven-3/3.6.3/binaries/apache-maven-3.6.3-bin.tar.gz && \
  tar -xzf /tmp/apache-maven.tar.gz -C /usr/local/maven --strip-components=1 && \
  rm -f /tmp/apache-maven.tar.gz && \
  ln -s /usr/local/maven/bin/mvn /usr/bin/mvn
  
# Install Node.js
RUN curl --silent --location https://deb.nodesource.com/setup_6.x | sudo bash - && \
apt-get update --y nodejs \
build-essential

ENV JAVA_HOME=/usr/local/jdk11 \
    MAVEN_HOME=/usr/local/maven \
    MAVEN_CONFIG="/root/.m2"
