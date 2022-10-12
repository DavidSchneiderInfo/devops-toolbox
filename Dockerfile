FROM davidschneiderinfo/ubuntu:22.04

RUN apt-get update && apt-get install -y \
    curl \
    gnupg \
    groff \
    less \
    software-properties-common \
    unzip \
    wget

RUN wget https://releases.hashicorp.com/terraform/1.3.0/terraform_1.3.0_linux_arm.zip
RUN unzip terraform_1.3.0_linux_arm.zip
RUN chmod +x terraform
RUN mv terraform /usr/local/bin

RUN wget -O- https://apt.releases.hashicorp.com/gpg | gpg --dearmor | tee /usr/share/keyrings/hashicorp-archive-keyring.gpg
RUN echo "deb [signed-by=/usr/share/keyrings/hashicorp-archive-keyring.gpg] https://apt.releases.hashicorp.com $(lsb_release -cs) main" | tee /etc/apt/sources.list.d/hashicorp.list
RUN apt-get update && apt-get -y install packer

RUN wget https://awscli.amazonaws.com/awscli-exe-linux-aarch64.zip
RUN unzip awscli-exe-linux-aarch64.zip
RUN ./aws/install

RUN curl -Lo kubectl https://storage.googleapis.com/kubernetes-release/release/$(curl -s https://storage.googleapis.com/kubernetes-release/release/stable.txt)/bin/linux/amd64/kubectl
RUN chmod +x ./kubectl
RUN mv ./kubectl /usr/local/bin/kubectl

RUN export DEBIAN_FRONTEND=noninteractive && apt-get update && apt-get install -y \
  ansible \
  python3-pip
RUN pip3 install boto boto3 

RUN mkdir -p /srv
RUN mkdir -p /tmp

WORKDIR /srv

COPY bin/* /usr/local/bin
COPY terraform /srv/terraform
COPY packer /srv/packer
COPY ansible /srv/ansible

ENTRYPOINT [ "middleware" ]
