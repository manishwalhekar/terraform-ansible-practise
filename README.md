# terraform-ansible

A hands-on DevOps project to provision AWS EC2 instances using **Terraform** and configure them using **Ansible**.

> 🚧 This project is a work in progress — built as part of learning Terraform and Ansible.

---

## Project Structure

```
terraform-ansible/
├── main.tf          # EC2, Security Group, Key Pair, VPC
├── providers.tf     # AWS provider and Terraform version
├── outputs.tf       # Instance IDs, Public IPs, Private IPs
└── README.md
```

## Infrastructure Overview

- **Cloud**: AWS
- **Region**: us-east-1
- **Instances**: 4 EC2 instances provisioned using `for_each`

| Name | AMI | OS |
|---|---|---|
| terraform-ansible-master | ami-0ec10929233384c7f | Ubuntu |
| terraform-ansible-1 | ami-01b14b7ad41e17ba4 | Amazon Linux |
| terraform-ansible-2 | ami-0ec10929233384c7f | Ubuntu |
| terraform-ansible-3 | ami-056244ee7f6e2feb8 | Red Hat |

---

## Prerequisites

- Terraform >= 1.0
- AWS CLI configured (`aws configure`)
- SSH key pair generated locally

---

## Usage

### 1. Clone the repo
```bash
git clone https://github.com/<your-username>/terraform-ansible.git
cd terraform-ansible
```

### 2. Add your public key
```bash
ssh-keygen -t rsa -f terraform-ansible-key
```

### 3. Run Terraform
```bash
terraform init
terraform validate
terraform plan
terraform apply
```

### 4. View outputs
```bash
terraform output
```

---

## Destroy Infrastructure
```bash
terraform destroy
```

---

## Roadmap

- [x] Provision EC2 instances using Terraform
- [ ] Configure instances using Ansible
- [ ] Set up Ansible inventory from Terraform outputs
- [ ] Deploy application using Ansible playbooks

---

## Author

**Manish Walhekar**  
Technology Analyst — DevOps | Infosys
