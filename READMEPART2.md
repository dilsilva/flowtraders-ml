 
# Terraform GCP Infrastructure (PART 2)

## Overview
This project sets up a Google Cloud infrastructure using Terraform with modular best practices. Key components include networking, GKE cluster, Identity Aware Proxy (IAP), CloudSQL, and storage.

## Modules
- **Networking**: Sets up a private VPC with subnets.
- **IAP**: Configures Identity Aware Proxy for secure access.
- **GKE**: Creates a GKE cluster with GPU node pools.
- **IAM**: Manages users and service accounts.
- **CloudSQL**: Provisions a MySQL database.
- **Storage**: Creates a storage bucket and filestore.

## Usage
1. Clone this repository.
2. Update `terraform.tfvars` with your project-specific values.
3. Initialize Terraform:
   ```bash
   terraform init
   ```
4. Plan and apply:
   ```bash
   terraform plan
   terraform apply
   ```

## Pre-Requisites
- Terraform version >= 1.4.
- A GCP project with billing enabled.
- Sufficient IAM permissions.

## Variables
The file `terraform.tfvars` have some example values for a dummy deploy, check it for more details.