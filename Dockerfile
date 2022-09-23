FROM ubuntu:22.04

RUN apt-get update && apt-get install -y gnupg software-properties-common unzip wget

RUN wget https://releases.hashicorp.com/terraform/1.3.0/terraform_1.3.0_linux_arm.zip
RUN unzip terraform_1.3.0_linux_arm.zip
RUN chmod +x terraform
RUN mv terraform /usr/local/bin 

WORKDIR /srv

COPY terraform /srv
COPY bin/* /usr/local/bin