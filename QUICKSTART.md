# Quick Start Guide

Get your DevOps EKS Pipeline up and running in minutes!

## ⚡ Prerequisites

Ensure you have the following installed:
- [AWS CLI](https://aws.amazon.com/cli/) (configured with credentials)
- [Terraform](https://www.terraform.io/downloads.html) >= 1.0
- [kubectl](https://kubernetes.io/docs/tasks/tools/)
- [Docker](https://docs.docker.com/get-docker/)

## 🚀 5-Minute Setup

### 1. Clone and Navigate
```bash
git clone <your-repository-url>
cd devops-eks-pipeline
```

### 2. Run Setup Script
```bash
chmod +x scripts/setup.sh
./scripts/setup.sh
```

### 3. Deploy Application
```bash
kubectl apply -f application/k8s/
```

### 4. Get Application URL
```bash
kubectl get svc devops-app-service
```

## 🧹 Cleanup

When you're done:
```bash
chmod +x scripts/cleanup.sh
./scripts/cleanup.sh
```

## 📚 Next Steps

- Read the [full documentation](README.md)
- Check out [learning notes](docs/learning-notes.md)
- Review [architecture diagrams](docs/architecture.md)

## 🆘 Need Help?

- Check [troubleshooting guide](docs/troubleshooting.md)
- Open an issue in your repository

---

**Estimated Time**: 10-15 minutes for complete setup
**Cost**: ~$0.10/hour for t3.medium instances