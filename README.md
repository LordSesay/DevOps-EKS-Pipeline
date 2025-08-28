# DEVOPS EKS PIPELINE 🚀  
> CI/CD Deployment of Dockerized Application to Amazon EKS Using Jenkins & Terraform

![AWS](https://img.shields.io/badge/Built%20With-AWS-orange?style=for-the-badge&logo=amazonaws)
![Kubernetes](https://img.shields.io/badge/Orchestration-EKS-blue?style=for-the-badge&logo=kubernetes)
![Status](https://img.shields.io/badge/Status-Completed-success?style=for-the-badge)

---

## 📌 What Problem Are We Solving?

Modern application delivery faces challenges such as:

- **Manual deployments** prone to human error  
- **Slow release cycles** due to fragmented tooling  
- **Lack of visibility** in build and deploy processes  
- **Environment inconsistencies** across dev/staging/prod  

**DevOps EKS Pipeline** solves these with an automated CI/CD solution built with Terraform, Jenkins, Docker, and Amazon EKS.

---

## 🎯 Project Goals

- Provision a production-ready EKS cluster with Terraform  
- Use Jenkins to build and push Docker containers  
- Deploy to EKS via automated Jenkins pipeline  
- Ensure scalability, observability, and maintainability of application infrastructure  
- Practice DevOps best practices on AWS  

---

## ⚙️ Tech Stack

| Tool/Service         | Role                                                          |
|----------------------|---------------------------------------------------------------|
| **Terraform**        | Provision AWS resources (VPC, IAM, EKS, ECR)                  |
| **Amazon EKS**       | Host the Kubernetes workloads                                 |
| **Jenkins (on EC2)** | CI/CD server to build, push, and deploy containers            |
| **Docker**           | Containerize application                                      |
| **Kubernetes (EKS)** | Deploy and orchestrate workloads                              |
| **AWS CLI + IAM**    | Manage infrastructure authentication                          |

---

## 🔁 How It Works

1. **Push code to GitHub**  
2. **Jenkins pulls code and builds Docker image**  
3. **Image pushed to AWS ECR**  
4. **Jenkins triggers a `kubectl apply` to update deployment in EKS**  
5. **Application served via LoadBalancer on EKS**  

---

## 🧩 Architecture Diagram

<p align="center">
  <img src="assets/eks-pipeline-architecture.png" alt="EKS Pipeline Architecture" width="80%">
</p>

---

## 🛠 Folder Structure

.
├── Jenkinsfile # CI/CD pipeline definition
├── terraform/ # IaC for EKS, VPC, IAM, ECR
├── k8s/ # Kubernetes manifests (deployment, service)
├── app/ # Sample application code
├── Dockerfile
└── assets/
└── eks-pipeline-architecture.png

yaml
Copy
Edit

---

## 💼 Business Use Case

A company wants to modernize their deployment process by implementing infrastructure as code and continuous deployment.  
This project enables scalable deployments to Amazon EKS with full automation and rollback safety using Jenkins pipelines.

---

## 📈 Business Value

- **Automation:** Zero manual deployment steps after code push  
- **Scalability:** Built on Kubernetes via AWS EKS  
- **Security:** IAM-managed roles with least privilege access  
- **Resilience:** Jenkins logs and EKS self-healing ensure uptime  
- **Speed to Market:** From code to deployment in minutes  

---

## 🔮 Future Enhancements

- [ ] Add Helm templating for Kubernetes deployments  
- [ ] Add Prometheus/Grafana monitoring stack  
- [ ] Use GitHub Actions for pipeline instead of Jenkins  
- [ ] Implement Blue/Green or Canary deployments  

---

## 🤝 Connect

Crafted by **[Malcolm Sesay](https://www.linkedin.com/in/malcolmsesay/)** — Let’s build scalable infrastructure together.

---

## 🏷️ Tags

`#AWS` `#DevOps` `#Terraform` `#CI/CD` `#Kubernetes` `#Jenkins` `#EKS` `#CloudEngineering` `#InfrastructureAsCode`
