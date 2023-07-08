terraform {
    required_providers {
        aws = {
            source  = "hashicorp/aws"
            version = "~> 4.1.0"
        }
    }

    required_version = "~> 1.5.0"
}

# Configure the AWS Provider
provider "aws" {
    region = "us-east-1"
}

resource "aws_s3_bucket" "terraform_state" {
    bucket = "raw-k8s-bucket"
    
    # lifecycle {
    #     prevent_destroy = true
    # }
}

resource "aws_s3_bucket_versioning" "terraform_state" {
    bucket = aws_s3_bucket.terraform_state.id

    versioning_configuration {
        status = "Enabled"
    }
}

resource "aws_dynamodb_table" "terraform_state_lock" {
    name           = "app-state"
    read_capacity  = 1
    write_capacity = 1
    hash_key       = "LockID"

    attribute {
        name = "LockID"
        type = "S"
    }
}
