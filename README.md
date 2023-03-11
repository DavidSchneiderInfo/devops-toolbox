# Devops Toolbox

A collection of tools to work on environments.

## Setup

Before using the toolbox you will need to create the necessary credentials. You will need an IAM account to connect to AWS and a S3 bucket to store the state. Once you obtained these follow these steps:

- Copy the file `.env.example` to `.env`
- Open the file `.env` in an editor
- Insert access key/secret as well as the bucket name
- Optional: define a prefix for the S3 bucket

Enter access key and secret and Copy the file `.env.example` to `.env` and edit t 

## Usage

### Terraform Init

```bash
docker-compose run --rm toolbox terraform_init
```

### Terraform Plan

```bash
docker-compose run --rm toolbox terraform_plan
```

### Terraform Apply

```bash
docker-compose run --rm toolbox terraform_apply
```
