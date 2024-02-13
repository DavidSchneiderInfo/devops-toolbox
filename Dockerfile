FROM alpine:latest

ENV TERRAFORM_VERSION=0.14.11
ENV PACKER_VERSION=1.10.1

RUN apk add --update --no-cache ansible  py3-pip zsh
RUN rm /usr/lib/python3.11/EXTERNALLY-MANAGED &&\
    pip install boto3

RUN wget https://releases.hashicorp.com/terraform/${TERRAFORM_VERSION}/terraform_${TERRAFORM_VERSION}_linux_amd64.zip && \
    unzip terraform_${TERRAFORM_VERSION}_linux_amd64.zip -d /usr/bin && \
    wget https://releases.hashicorp.com/packer/${PACKER_VERSION}/packer_${PACKER_VERSION}_linux_amd64.zip && \
    unzip packer_${PACKER_VERSION}_linux_amd64.zip -d /usr/bin && \
    rm -rf /tmp/* && \
    rm -rf /var/cache/apk/* && \
    rm -rf /var/tmp/*

RUN mkdir /devops && \
    mkdir /devops/versions && \
    mkdir /tmp/terraform

WORKDIR /devops

COPY bin/* /usr/local/bin
COPY terraform /devops/terraform
COPY packer /devops/packer
COPY ansible /devops/ansible

RUN ansible --version > /devops/versions/ansible.txt && \
    packer -v > /devops/versions/packer.txt && \
    terraform -v > /devops/versions/terraform.txt

ENTRYPOINT [ "entrypoint" ]
