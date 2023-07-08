# Create a private subnet within the VPC for Master node
resource "aws_subnet" "raw_k8s_subnet_private" {
    vpc_id            = aws_vpc.raw_k8s_vpc.id
    cidr_block        = "10.0.2.0/24"  # Change to your desired subnet CIDR block
    availability_zone = "${var.aws_region}a"  # Change to your desired availability zone
    map_public_ip_on_launch = true
    enable_resource_name_dns_a_record_on_launch = true

    tags = {
        Name = "raw_k8s_subnet"
        Privacy = "private"
    }
}

# Create a public subnet within the VPC for Worker nodes
resource "aws_subnet" "raw_k8s_subnet_public" {
    vpc_id            = aws_vpc.raw_k8s_vpc.id
    cidr_block        = "10.0.1.0/24" # Change to your desired subnet CIDR block
    availability_zone = "${var.aws_region}b" # Change to your desired availability zone
    map_public_ip_on_launch = true
    enable_resource_name_dns_a_record_on_launch = true

    tags = {
        Name = "raw_k8s_subnet"
        Privacy = "public"
    }
}
