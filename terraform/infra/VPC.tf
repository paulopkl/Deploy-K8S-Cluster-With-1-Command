# Create a VPC
resource "aws_vpc" "raw_k8s_vpc" {
    cidr_block = "10.0.0.0/16"
    
    tags = {
        Name = "raw_k8s_vpc"
    }
}
