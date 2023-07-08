# Create a security group for SSH access
resource "aws_security_group" "raw_k8s_ssh_security_group" {
    name        = "raw_k8s_ssh-security-group"
    description = "Allow SSH access"
    vpc_id = aws_vpc.raw_k8s_vpc.id

    ingress {
        from_port   = 22
        to_port     = 22
        protocol    = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
    }

    # ingress {
    #     from_port   = 0
    #     to_port     = 0
    #     protocol    = "-1"
    #     cidr_blocks = ["0.0.0.0/0"]
    # }

    # ingress {
    #     from_port = 80
    #     to_port   = 80
    #     # any
    #     #     cidr_blocks = ["0.0.0.0/0"]
    # }

    # ingress {
    #     from_port = 443
    #     to_port   = 443
    #     # any
    #     #     cidr_blocks = ["0.0.0.0/0"]
    # }

    # ingress {
    #     from_port = 6443
    #     to_port   = 6443
    # #     static company IP
    # }

    egress {
        from_port   = 0
        to_port     = 0
        protocol    = "-1"
        cidr_blocks = ["0.0.0.0/0"] 
    }

    tags = {
        Name = "raw_k8s_ssh-security-group"
    }
}
