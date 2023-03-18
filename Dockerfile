FROM alpine:latest

RUN apk add --no-cache ansible packer terraform zsh

RUN mkdir /devops && \
    mkdir /devops/versions

WORKDIR /devops

COPY bin/* /usr/local/bin
COPY terraform /devops/terraform
COPY packer /devops/packer
COPY ansible /devops/ansible

RUN ansible --version > /devops/versions/ansible.txt && \
    packer -v > /devops/versions/packer.txt && \
    terraform -v > /devops/versions/terraform.txt

ENTRYPOINT [ "entrypoint" ]
