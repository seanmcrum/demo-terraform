# Terraform

A simple example showing the features that Terraform provides

## What is Terraform?

- OpenSource application by HashiCorp
- Declarative infrastructure as code
- Uses HashiCorp Language (HCL)
- Abstraction on top of cloud providers

### Setup

1. Install Terraform

    ```bash
    brew install terraform
    ```

2. Create `example.tfvars` locally and provide the keypair for Terraform to interact with AWS.
    ```hcl
    example_aws_access_key_id     = "<aws key id>"
    example_aws_secret_access_key = "<aws secret>"
    ```

### Repository Structure

The only required file is `main.tf` but best practice is to group code based on purpose into separate `*.tf` files. It's recommended that all variables and their default values be stored in `variables.tf`. 

Once a main.tf has been setup `terraform init` will pull the necessary plugins to interact with providers. The plugins will be stored in `.terraform` directory. 

### Terraform State

Terraform uses a `*.tfstate` file in the root directory to keep track of all assets it has created. This is stored after an initial `terraform apply`

### Modules

Every directory with `*.tf` files is referred to as a _Module_. Modules can be imported or "applied" to create resources.

## Example_1

_Example_1 creates a single AWS EC2 node in an AWS account._

To perform a dry run and view what assets Terraform wants to create:

    ```bash
    terraform plan -var-file="example.tfvars"
    ```

### Create EC2 node

    ```bash
    terraform apply -var-file="example.tfvars"
    ```

### Destroy the EC2 node

    ```bash
    terraform destroy -var-file="example.tfvars"
    ```

### View information about resources Terraform created

    ```bash
    terraform state list
    terraform state show <resource>
    ```

## Example_2

_Example_2 creates two EC2 nodes; one using a resource in `main.tf`, and the other using submodule `module_ec2`._