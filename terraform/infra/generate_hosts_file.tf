# Save public IP addresses and usernames to a file
resource "local_file" "public_ips_file" {
    depends_on = [
        aws_instance.raw_k8s_ec2_instance_master, 
        aws_instance.raw_k8s_ec2_instance_workers,
    ]

    filename = "../../shared/hosts"
    content = <<-EOT
    [k8s-master]
    master-node ansible_host=${aws_instance.raw_k8s_ec2_instance_master[0].public_ip} ansible_user=${var.aws_instance_user} ansible_ssh_private_key_file=~/.ssh/${var.aws_key_pair_name}.pem ansible_ssh_common_args='-o StrictHostKeyChecking=no'

    [k8s-worker]
    worker-node ansible_host=${aws_instance.raw_k8s_ec2_instance_workers[0].public_ip} ansible_user=${var.aws_instance_user} ansible_ssh_private_key_file=~/.ssh/${var.aws_key_pair_name}.pem ansible_ssh_common_args='-o StrictHostKeyChecking=no'
    worker-node ansible_host=${aws_instance.raw_k8s_ec2_instance_workers[1].public_ip} ansible_user=${var.aws_instance_user} ansible_ssh_private_key_file=~/.ssh/${var.aws_key_pair_name}.pem ansible_ssh_common_args='-o StrictHostKeyChecking=no'
EOT
}
