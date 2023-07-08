# Create a route table
resource "aws_route_table" "raw_k8s_route_table" {
    vpc_id = aws_vpc.raw_k8s_vpc.id

    route {
        cidr_block = "0.0.0.0/0"
        gateway_id = aws_internet_gateway.raw_k8s_igw.id
    }

    tags = {
        Name = "raw_k8s_route_table"
    }
}

# and associate it with the subnet
resource "aws_route_table_association" "raw_k8s_association_public" {
    subnet_id      = aws_subnet.raw_k8s_subnet_public.id
    route_table_id = aws_route_table.raw_k8s_route_table.id
}

resource "aws_route_table_association" "raw_k8s_association_private" {
    subnet_id      = aws_subnet.raw_k8s_subnet_private.id
    route_table_id = aws_route_table.raw_k8s_route_table.id
}
