# Devops Toolbox

A collection of tools to work on environments.

## Configuration

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

### Packer

With Packer we build the images used for provisioning our server instance.

```bash
docker-compose run toolbox packer_build
```

### Ansible

We use Ansible within Packer to configure base images or later directly to re-configure existing infrastructure.

```bash
docker-compose run toolbox ansible_\*
```

- ansible_ping
- ansible_playbook

### Terraform

Once we have prepared images, we can build up and maintain the infrastructure with Terraform.

```bash
docker-compose run toolbox terraform_\*
```

- terraform_apply
- terraform_destroy
- terraform_init
- terraform_plan
- terraform_workspace_create
- terraform_workspace_delete
- terraform_workspace_list
- terraform_workspace_select

