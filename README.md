# DevOps EKS Pipeline

## 🎯 Problem Statement

Modern applications require robust, scalable, and automated deployment pipelines. Traditional deployment methods often suffer from:
- Manual deployment processes prone to human error
- Lack of scalability and high availability
- Inconsistent environments between development and production
- Limited monitoring and observability
- Security vulnerabilities in deployment processes

## 💡 Solution Overview

This project implements a complete DevOps pipeline using Amazon EKS (Elastic Kubernetes Service) that addresses these challenges through:

- **Infrastructure as Code (IaC)** using Terraform
- **Containerized applications** with Docker
- **Automated CI/CD pipeline** with GitHub Actions
- **Kubernetes orchestration** for scalability and reliability
- **Monitoring and logging** with CloudWatch and Prometheus
- **Security best practices** with RBAC and network policies

## 🏗️ Architecture

```
┌─────────────────┐    ┌─────────────────┐    ┌─────────────────┐
│   Developer     │    │   GitHub        │    │   AWS EKS       │
│   Local Dev     │───▶│   Repository    │───▶│   Cluster       │
└─────────────────┘    └─────────────────┘    └─────────────────┘
                              │                        │
                              ▼                        ▼
                       ┌─────────────────┐    ┌─────────────────┐
                       │   GitHub        │    │   Application   │
                       │   Actions       │    │   Pods          │
                       └─────────────────┘    └─────────────────┘
```

## 📁 Project Structure

```
devops-eks-pipeline/
├── infrastructure/          # Terraform IaC files
│   ├── modules/            # Reusable Terraform modules
│   ├── environments/       # Environment-specific configs
│   └── main.tf            # Main Terraform configuration
├── application/            # Sample application code
│   ├── src/               # Application source code
│   ├── Dockerfile         # Container definition
│   └── k8s/              # Kubernetes manifests
├── .github/workflows/      # CI/CD pipeline definitions
├── scripts/               # Utility scripts
├── docs/                  # Documentation and diagrams
└── README.md             # This file
```

## 🚀 Quick Start

### Prerequisites

- AWS CLI configured with appropriate permissions
- Terraform >= 1.0
- kubectl
- Docker
- GitHub account

### Setup Instructions

1. **Clone the repository**
   ```bash
   git clone <your-repository-url>
   cd devops-eks-pipeline
   ```

2. **Configure AWS credentials**
   ```bash
   aws configure
   ```

3. **Initialize Terraform**
   ```bash
   cd infrastructure
   terraform init
   terraform plan
   terraform apply
   ```

4. **Configure kubectl**
   ```bash
   aws eks update-kubeconfig --region us-west-2 --name my-eks-cluster
   ```

5. **Deploy the application**
   ```bash
   kubectl apply -f application/k8s/
   ```

## 🔧 Components

### Infrastructure (Terraform)
- **EKS Cluster**: Managed Kubernetes service
- **VPC & Networking**: Secure network configuration
- **IAM Roles**: Least privilege access
- **Security Groups**: Network-level security

### Application
- **Sample Web App**: Node.js/Python application
- **Docker Container**: Containerized deployment
- **Kubernetes Manifests**: Deployment, Service, Ingress

### CI/CD Pipeline
- **GitHub Actions**: Automated testing and deployment
- **Docker Build**: Container image creation
- **EKS Deployment**: Automated application updates

## 📊 Monitoring & Observability

- **CloudWatch**: AWS native monitoring
- **Prometheus**: Metrics collection
- **Grafana**: Visualization dashboards
- **ELK Stack**: Centralized logging

## 🔒 Security Features

- **RBAC**: Role-based access control
- **Network Policies**: Pod-to-pod communication rules
- **Secrets Management**: Kubernetes secrets
- **Image Scanning**: Container vulnerability assessment

## 📚 Learning Resources

See [docs/learning-notes.md](docs/learning-notes.md) for detailed study notes and learnings.

## 🤝 Contributing

1. Fork the repository
2. Create a feature branch
3. Make your changes
4. Submit a pull request

## 📄 License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

## 📞 Support

For questions or support, please open an issue in the GitHub repository.

---

**Author**: LordSesay  
**Last Updated**: $(date)