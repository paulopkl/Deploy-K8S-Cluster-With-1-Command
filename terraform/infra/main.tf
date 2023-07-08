terraform {
    required_providers {
        aws = {
            source  = "hashicorp/aws"
            version = "~> 4.1.0"
        }
    }

    backend "s3" {
        region = "us-east-1"
        bucket = "raw-k8s-bucket"
        encrypt = true
        key = "terraform.tfstate"
    }

    required_version = "~> 1.5.0"
}

# Configure the AWS Provider
provider "aws" {
    region = var.aws_region
}

# data "aws_ami" "my_ami" {
#     # most_recent = true
    
#     # filter {
#     #     name = "name"
#     #     values = ["Name:raw_k8s_ec2_instance"]
#     # }

#     # owners      = ["self"]
# }

# output "default_user" {
#     value = data.aws_ami.my_ami
# }
