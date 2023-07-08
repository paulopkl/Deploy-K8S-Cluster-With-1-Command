# Create an internet gateway
resource "aws_internet_gateway" "raw_k8s_igw" {
    vpc_id = aws_vpc.raw_k8s_vpc.id

    tags = {
        Name = "raw_k8s_igw"
    }
}
