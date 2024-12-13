terraform {
  backend "s3" {
    bucket         = "optimal-solutions-terraform-state"
    key            = "eos/eks/terraform.tfstate"
    region         = "ap-south-1"
    dynamodb_table = "eos_table"
  }
}