# AWS VPC Module with VM Architecture - Terraform Assignment

## Overview

This repository contains a Terraform module that creates a complete AWS infrastructure including:
- A VPC with public and private subnets
- Public and private EC2 instances
- NAT Gateway for private subnet internet access
- Application Load Balancer
- S3 bucket for assets storage
- Appropriate security groups and networking configurations

## Prerequisites

- Terraform v1.0 or later installed
- AWS account with appropriate permissions
- AWS CLI configured with credentials
- SSH key pair (for EC2 instance access)

## Module Structure


aws-vpc-module/
    main.tf                 # Main module configuration
    variables.tf            # Module input variables
    outputs.tf              # Module outputs
    README.md               # This documentation
    environments/
        Dev/
            main.tf             # Dev environment configuration
            terraform.tfvars    # Dev environment variables
            provider.tf         # Provider configuration
        Stage/
        Prod/



## Features

- VPC Architecture:
  - Customizable CIDR blocks for VPC and subnets
  - Multi-AZ deployment for high availability
  - Internet Gateway for public subnets
  - NAT Gateway for private subnets

- Compute Resources:
  - Public-facing EC2 instance in public subnet
  - Private EC2 instance in private subnet
  - Ubuntu AMI (free tier eligible)
  - Configurable instance types

- Networking:
  - Security groups with least-privilege access
  - Route tables for public and private subnets
  - Elastic IP for NAT Gateway

- Load Balancing:
  - Application Load Balancer
  - Target group with health checks
  - HTTP listener

- Storage:
  - S3 bucket for assets storage
  - Unique bucket name generation

## Usage

### 1. Clone the repository


git clone https://github.com/your-username/HJH.git
   cd HJH/AWS_VPC_module

### 2. Initialize Terraform


terraform init


### 3. Review and customize variables

Edit the `environment/Dev/terraform.tfvars` file to match your requirements:


environment = "dev"
vpc_cidr = "10.0.0.0/16"
public_subnet_cidrs = ["10.0.1.0/24", "10.0.2.0/24"]
private_subnet_cidrs = ["10.0.3.0/24", "10.0.4.0/24"]
instance_type = "t2.micro"
ssh_public_key_path = "~/.ssh/id_rsa.pub"
region = "us-east-1"


### 4. Plan and apply


cd environments/Dev
terraform plan
terraform apply


## Input Variables

| Name | Description | Type | Default |
|------|-------------|------|---------|
| environment | Environment name (dev, staging, prod) | string | "dev" |
| vpc_cidr | CIDR block for the VPC | string | "10.0.0.0/16" |
| public_subnet_cidrs | List of public subnet CIDR blocks | list(string) | ["10.0.1.0/24", "10.0.2.0/24"] |
| private_subnet_cidrs | List of private subnet CIDR blocks | list(string) | ["10.0.3.0/24", "10.0.4.0/24"] |
| instance_type | EC2 instance type | string | "t2.micro" |
| ssh_public_key_path | Path to the SSH public key file | string | "~/.ssh/id_rsa.pub" |
| region | AWS region | string | "us-east-1" |

## Outputs

| Name | Description |
|------|-------------|
| vpc_id | ID of the created VPC |
| public_subnet_ids | IDs of the public subnets |
| private_subnet_ids | IDs of the private subnets |
| public_vm_public_ip | Public IP address of the public VM |
| private_vm_private_ip | Private IP address of the private VM |
| alb_dns_name | DNS name of the Application Load Balancer |
| assets_bucket_name | Name of the assets S3 bucket |

## Clean Up

To destroy all created resources:


terraform destroy


