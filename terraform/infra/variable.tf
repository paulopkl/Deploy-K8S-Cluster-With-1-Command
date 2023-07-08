variable "aws_region" {
    type = string
    default = "us-east-1"
}

variable "aws_instance_user" {
    type = string
    default = "ubuntu"
}

variable "aws_ami_code" {
    type = string
    default = "ami-053b0d53c279acc90"
}

variable "aws_intance_type" {
    type = string
    default = "t3.medium"
}

variable "aws_key_pair_name" {
    type = string
    default = "aw-k8s-key-pair"
}
