# Resource to create a SSH private key
resource "tls_private_key" "raw_k8s_key" {
    algorithm = "RSA"
    rsa_bits  = 4096
}

# Resource to Create Key Pair and save it locally
resource "aws_key_pair" "raw_k8s_ssh_key_pair" {
    depends_on = [tls_private_key.raw_k8s_key]

    key_name   = var.aws_key_pair_name
    public_key = tls_private_key.raw_k8s_key.public_key_openssh # Specify the path to your public key

    provisioner "local-exec" {
        command = "sudo rm ~/.ssh/${var.aws_key_pair_name}.pem && sudo echo '${tls_private_key.raw_k8s_key.private_key_pem}' > ~/.ssh/${var.aws_key_pair_name}.pem && chmod 400 ~/.ssh/${var.aws_key_pair_name}.pem"
        # command = "echo '${tls_private_key.raw_k8s_key.private_key_pem}' > ~/.ssh/${var.aws_key_pair_name}.pem && chmod 400 ~/.ssh/${var.aws_key_pair_name}.pem"
    }
}
