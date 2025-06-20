# terraform_static_site/README.md

## 📌 Project: Static Website Hosting on AWS with Terraform

This project provisions a high-availability static website using **Amazon S3**, **EC2**, and **Route 53**, all managed via **Terraform**. It demonstrates DNS routing, static site hosting, and failover architecture.

---

## 🧱 Architecture Overview

- **Amazon S3** hosts the static website (HTML/CSS/JS).
- **Amazon EC2** runs a backup Nginx web server.
- **Route 53** routes domain traffic to S3, with optional failover to EC2.

![Architecture Diagram](./architecture.png)

---

## 📂 Project Structure

```
terraform-static-site/
├── main.tf
├── variables.tf
├── outputs.tf
├── modules/
│   ├── s3/
│   │   └── main.tf
│   ├── ec2/
│   │   └── main.tf
│   └── route53/
│   |    └── main.tf
│   └── CloudFront/
│       └── main.tf
├── user_data.sh
├── index.html
├── README.md
```

---

## 🚀 How to Deploy

```bash
# 1. Initialize Terraform
terraform init

# 2. Review the execution plan
terraform plan

# 3. Apply the configuration
terraform apply

# 4. Destroy resources (when finished)
terraform destroy
```

---

## 📦 Outputs

- S3 Website URL
- EC2 Public IP
- CloudFront Distribution Domain name

---

## 🔍 Learning Outcomes

- Understand S3 static site hosting
- Deploy and configure EC2 with a startup script
- Register and manage DNS records with Route 53
- Build modular and reusable Terraform code

---

## 📘 Requirements

- AWS CLI configured
- Terraform installed
- Registered domain (Route 53 Hosted Zone)

---

## 🧠 Inspiration
Ideal for beginner to intermediate DevOps, SRE, or cloud engineering portfolios. Demonstrates practical use of AWS infrastructure with real-world application.

## Future Contributions
Automate deployments using GitHub Actions, Jenkins, or similar.
Include an architecture diagram showing the flow (e.g. GitHub → S3 → CloudFront → DNS).
Add Cloudfront to enhance speed and performance of the static website
