Here is a rewritten README file:

# AWS ECS with Terraform Example

This repository provides an example for deploying a container to AWS ECS using Terraform. 

## Overview

The Terraform configuration defines an ECS cluster, task definition, service, and other supporting resources to run a containerized application on AWS.

## Prerequisites

- Terraform 1.1.9+
- AWS account

## Usage

1. Clone the repository 
```
git clone https://github.com/<your_repo>
```

2. Create a `terraform.tfvars` file with your AWS credentials and Docker image name:

```
aws_access_key = "<your_aws_access_key>"
aws_secret_key = "<your_aws_secret_key>" 
aws_region = "<aws_region>"
app_name = "myapp"
image = "<your_docker_id>/myapp:latest"
container_port = 8080
```

3. Run Terraform:

```
terraform init
terraform plan
terraform apply
```

This will create the ECS cluster, task definition, service, and other resources. The containerized application can then be accessed via the public IP of the ECS service.

## Cleanup

To destroy the infrastructure, simply run:

```
terraform destroy
```

Let me know if you would like me to modify or expand the README further.