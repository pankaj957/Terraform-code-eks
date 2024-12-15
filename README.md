Terraform EKS Cluster Setup
This repository contains Terraform configuration files to create an AWS EKS (Elastic Kubernetes Service) cluster with associated networking components. The configuration includes S3 for state file storage and locking to ensure safe and concurrent operations.

Files
backend.tf: Configuration for using an S3 bucket and DynamoDB for Terraform state file management and locking.
eks.tf: Creates the EKS cluster and node group.
vpc.tf: Sets up the VPC, subnets, and route tables required for the EKS cluster.
output.tf: Defines the output values, including the EKS cluster endpoint and kubeconfig.
provider.tf: Configures the AWS provider and sets the region.
role.tf: Creates IAM roles and policies for EKS worker nodes and the EKS control plane.
sg.tf: Configures security groups for the EKS nodes and control plane.
Prerequisites
Terraform 1.x
AWS Account with necessary IAM permissions
AWS CLI configured with access to your account
An S3 bucket and DynamoDB table for storing and locking the Terraform state files (if not already created, you can create them manually or through Terraform)
Setup
1. Initialize the Terraform configuration
Before running Terraform commands, initialize the working directory:

bash
Copy code
terraform init
This will download the necessary provider plugins and initialize the backend configuration for state management.

2. Plan the Infrastructure
Run the terraform plan command to review the infrastructure that will be created.

bash
Copy code
terraform plan
This command shows what resources will be created, modified, or destroyed.

3. Apply the Configuration
To create the infrastructure, run:

bash
Copy code
terraform apply
Confirm the action when prompted to proceed.

4. Access the EKS Cluster
Once the EKS cluster is created, you can get the cluster endpoint and kubeconfig with:

bash
Copy code
terraform output eks_cluster_endpoint
terraform output kubeconfig
Use the provided kubeconfig to interact with your cluster.

bash
Copy code
aws eks --region <region> update-kubeconfig --name <cluster_name>
5. Destroy the Infrastructure
To destroy the resources created by Terraform:

bash
Copy code
terraform destroy
State Management
This configuration uses an S3 bucket and DynamoDB for state file locking:

backend.tf defines the S3 bucket and DynamoDB table for state file management and locking. Ensure these resources are properly configured and the DynamoDB table has a LockID as the primary key.
Notes
Ensure your AWS credentials are set up before using this configuration.
Modify any variables such as region, instance types, or node configurations as per your requirements.
The security group (sg.tf) and IAM roles (role.tf) should be tailored based on the specific security requirements of your project.