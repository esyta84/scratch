# vSphere VM Terraform Enterprise Example

This example demonstrates how to deploy a virtual machine on VMware vSphere using Terraform Enterprise from a local CLI.

## Prerequisites

1. [Terraform CLI](https://www.terraform.io/downloads.html) installed locally (version >= 1.0.0)
2. Access to a Terraform Enterprise account
3. Access to a vSphere environment
4. A VM template in vSphere to clone from

## Setup

1. Copy `terraform.tfvars.example` to `terraform.tfvars` and update the values:
   ```bash
   cp terraform.tfvars.example terraform.tfvars
   ```

2. Edit `terraform.tfvars` to set your specific values:
   - Terraform Enterprise organization and workspace
   - vSphere connection details
   - vSphere infrastructure details
   - VM configuration
   - Network configuration

## Authentication

### Terraform Enterprise Authentication

To authenticate with Terraform Enterprise from the CLI, you need to generate a token:

1. Log in to your Terraform Enterprise account
2. Go to User Settings > Tokens
3. Generate a new token
4. Set the token in your environment:

```bash
export TF_TOKEN_app_terraform_io=YOUR_TOKEN
```

For custom Terraform Enterprise installations, use:

```bash
export TF_TOKEN_<HOSTNAME>=YOUR_TOKEN
```

### vSphere Authentication

vSphere credentials are provided in the `terraform.tfvars` file. For enhanced security, consider using environment variables:

```bash
export TF_VAR_vsphere_user=your-vsphere-user
export TF_VAR_vsphere_password=your-vsphere-password
```

## Usage

Initialize Terraform to set up the Terraform Enterprise integration:

```bash
terraform init
```

Create a plan to see what changes will be made:

```bash
terraform plan
```

Apply the changes to create the VM:

```bash
terraform apply
```

When prompted, type `yes` to confirm.

## Destroy Resources

To destroy the created resources:

```bash
terraform destroy
```

When prompted, type `yes` to confirm.

## Remote State Management

When using Terraform Enterprise, the state is stored remotely in your Terraform Enterprise workspace. This provides:

- Secure storage of state
- State locking to prevent concurrent modifications
- Team collaboration
- Version history

## Workspace Variables

You can also set variables directly in the Terraform Enterprise workspace UI. These will override any variables set in your local `terraform.tfvars` file.

## CI/CD Integration

For CI/CD pipelines, you can use the Terraform CLI in your pipeline with the appropriate TF_TOKEN environment variable set. 