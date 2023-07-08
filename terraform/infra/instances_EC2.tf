# Create EC2 Master instance in the private subnet
resource "aws_instance" "raw_k8s_ec2_instance_master" {
    depends_on = [aws_key_pair.raw_k8s_ssh_key_pair]

    count         = 1
    ami           = var.aws_ami_code
    instance_type = var.aws_intance_type
    subnet_id     = aws_subnet.raw_k8s_subnet_private.id
    vpc_security_group_ids = [aws_security_group.raw_k8s_ssh_security_group.id]
    key_name = aws_key_pair.raw_k8s_ssh_key_pair.key_name

    tags = {
        Name = "raw_k8s_ec2_instance_master"
        Type = "master"
        Privacy = "private"
    }
}

# Create EC2 Worker instances in the public subnet
resource "aws_instance" "raw_k8s_ec2_instance_workers" {
    depends_on = [aws_key_pair.raw_k8s_ssh_key_pair]

    count         = 2
    ami           = var.aws_ami_code
    instance_type = var.aws_intance_type
    subnet_id     = aws_subnet.raw_k8s_subnet_public.id
    vpc_security_group_ids = [aws_security_group.raw_k8s_ssh_security_group.id]
    key_name = aws_key_pair.raw_k8s_ssh_key_pair.key_name

    tags = {
        Name = "raw_k8s_ec2_instance_worker"
        Type = "worker"
        Privacy = "public"
    }
}
