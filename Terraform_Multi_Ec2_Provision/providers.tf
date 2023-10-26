# terraform {
#   required_providers {
#     aws = {
#       source = "hasicorp/aws"
#       version = "~> 4.17.1"
#     }
#   }
# }

## When you use access & secreate key for login :-
provider "aws" {
  region     = "us-east-1"
  access_key = "AKI46HGbS6XXXXXXXXXXX"
  secret_key = "yTKmE4YIO9XXXXXXXXXXXXXXXXXXX"
}

## When you use assume role for login :-
# provider "aws" {
#   region = "us-east-1"
#   profile = "default"
#     assume_role {
#       role_arn = "arn:aws:iam:<aws_account_id>:role/<assume_role_name>"
#       session_name = "terraform"
#     }
#     default_tags {
#       tags = {
#         CreatedBy = "Terraform"
#         Owner = "Abhishek.Singh"
#       }
#     }
# }


## Remote Backend to store teffraform state file in s3 bucket
terraform {
  backend "s3" {
    bucket = "statefileterraform"
    key = "cwagent/terraform/terraform.tfstate"
    region = "us-east-1"
    profile = "default"
  }
}



# Point needs to work on
#User Swict role insteadoff access & secreate keys
# use tfvars file
# Create Custome vpc
