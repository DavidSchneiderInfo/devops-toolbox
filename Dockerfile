FROM alpine:latest

RUN apk add --update --no-cache ansible packer py3-pip terraform zsh
RUN pip install boto3

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
