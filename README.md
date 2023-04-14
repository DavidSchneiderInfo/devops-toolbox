# Devops Toolbox

A collection of tools to work on environments.

## Setup

Before using the toolbox you will need to create the necessary credentials. You will need 
- an IAM account to connect to AWS 
- a S3 bucket to store the state
- a Route53 zone

Once you prepared everything follow these steps:

- Copy the file `.env.example` to `.env`
- Open the file `.env` in an editor
- Configure
  - AWS access key/secret
  - bucket name
  - DNS zone ID
- Configure a domain name (has to be the same as the DNS zone)
- Configure an environment name
- Optional: define a prefix for the S3 bucket
- Optional: define a region and zone for the environment

 

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
