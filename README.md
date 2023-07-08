# Deploy a Kubernetes Cluster (EC2 machines) with 1 Command

## Result:

```shell
make deploy
```

1. To run this project `make sure` you have the [necessary requirements](#Prerequisites)
2. It makes a deploy of your entire infraestructure and a cluster kubernetes on AWS.

## Description

This project aims to provide a streamlined setup and configuration guide for working with WSL (Windows Subsystem for Linux), AWS CLI (Command Line Interface), Terraform, Ansible, and Kubernetes. The README.md file serves as a central reference point for developers and users to get started with these tools.

## Table of Contents

- [Prerequisites](#Prerequisites)
- [Installation](#Installation)
- [WSL Setup](#WSL-Setup)
- [AWS CLI Configuration](#AWS-CLI-Configuration)
- [Terraform](#Terraform)
- [Ansible](#Ansible)
- [Infrastructure](#Infrastructure-on-AWS)
- [Kubernetes](#Kubernetes)
- [Contributing](#Contributing)
- [License](#License)

## Prerequisites

Before proceeding with the installation and setup, make sure you have the following prerequisites:

- Using Linux or inside a WSL instance on (Windows 10/11).
- AWS CLI installed and configured with your user/admin credentials.
- Ansible CLI installed and properly configured.
- Terraform CLI installed and properly configured.
- make CLI installed.
- Using an internet network without proxy configuration.
- Run all commands as root user (sudo), root access.

## Installation

1. Clone this repository to your local machine.
2. Open a terminal or command prompt in the cloned repository directory.

## WSL Setup

`Note: If you already have WSL installed, skip to the next step`
If you are using Windows make sure that WSL 2 is installed and working by command:

```shell
wsl --version
```

If it isn't working follow these steps of [WSL Installation](https://learn.microsoft.com/en-us/windows/wsl/install)

## AWS CLI Configuration

`Note: If you already have AWS CLI installed and configured with your credentials, skip to the next step`
To configure AWS CLI and connect it to your AWS account, perform the following steps:

1. Run the following command and follow the prompts to provide your AWS Access Key ID, Secret Access Key, default region, and output format:

```shell
aws configure
```

2. Verify the configuration by running a test command:

```shell
aws s3 ls
```

If the command returns a list of your S3 buckets, the AWS CLI configuration was successful.

## Terraform

`Note: If you already have AWS CLI installed and configured with your credentials, skip to the next step`
Terraform is used in this project to provision and manage the infrastructure. 
Verify if it's working by:

```shell
terraform init
```

If it isn't working follow these steps of [Terraform Installation](https://developer.hashicorp.com/terraform/tutorials/aws-get-started/install-cli?in=terraform%2Faws-get-started)

## Ansible

`Note:  Ansible is available only on Linux, so if you are using Windows make sure you use WSL.`
Ansible is used to automate the configuration of Kubernetes cluster deployment.
In this tutorial i recommend you to use the version 1.7 of ansible.

if you don't have ansible installed, follow these installation steps:

1. Install Ansible by running:

```shell
sudo apt update && sudo apt install ansible
```

2. Verify installation:

```shell
ansible --version
```

If the above command returns an error, follow the installation process from the official documentation [Ansible Installation Guide](https://docs.ansible.com/ansible/latest/installation_guide/intro_installation.html#installing-ansible-on-linux)



## Infrastructure on AWS

The infrastructure is composed by:
- VPC on top.
- 2 subnets (1 public subnet for worker nodes, 1 private subnet for control plane).
- Security group for management access.

## Kubernetes

Kubernetes is an open-source container orchestration platform that automates the deployment, scaling, and management of containerized applications.

In this project we are using Kubernetes 1.26.1, initializig the cluster with Kubeadm, these are the components of our on premise cluster:

1. (Kubernetes API Version): for this project we are using (Kubeadm, Kubelet, Kubectl) on version 1.26.1, because of distro compatibilities (Ubuntu 22.04).
2. (CNI/Calico) - Container Network Interface: The CRI provides a standardized API for container operations, such as starting, stopping, and monitoring containers
    - In this project we are using Calico 3.0.3 as CRI
3. (CRI/Containerd) - Container Runtime Interface: CNI provides a standardized API for networking plugins to configure network interfaces, IP addresses, routing tables, and other networking aspects required for containers to communicate with each other and the external world.
    - In this project we are using Containerd - 1.6.21 with Runc of docker Repository.

## Contributing

Contributions to this project are welcome! 
If you have any suggestions, improvements, or bug fixes, please submit a pull request or open an issue.

## License

This project is licensed under the MIT License. Feel free to modify and distribute it as per your requirements.

Now that you have completed the installation and setup of WSL, AWS CLI, Terraform, Ansible, and Kubernetes, you are ready to leverage these powerful tools for your development and infrastructure management tasks. Refer to the specific sections in this README.md file for further instructions and guidance on each tool. Happy coding and deploying!
