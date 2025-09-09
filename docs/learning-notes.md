# DevOps EKS Pipeline - Learning Notes & Study Guide

## 📚 Core Concepts Learned

### 1. Amazon EKS (Elastic Kubernetes Service)

**What is EKS?**
- Managed Kubernetes service by AWS
- Eliminates need to install, operate, and maintain Kubernetes control plane
- Automatically scales and manages the Kubernetes control plane across multiple AZs

**Key Benefits:**
- **High Availability**: Control plane runs across multiple AZs
- **Security**: Integrated with AWS IAM and VPC
- **Scalability**: Auto-scaling capabilities
- **Managed Updates**: Automatic Kubernetes version updates

**EKS Architecture Components:**
```
┌─────────────────┐    ┌─────────────────┐    ┌─────────────────┐
│   EKS Control   │    │   Worker Nodes  │    │   Applications  │
│     Plane       │───▶│   (EC2/Fargate) │───▶│     (Pods)      │
│  (AWS Managed)  │    │                 │    │                 │
└─────────────────┘    └─────────────────┘    └─────────────────┘
```

### 2. Infrastructure as Code (IaC) with Terraform

**Why Terraform?**
- **Declarative**: Describe desired state, not steps
- **Version Control**: Infrastructure changes tracked in Git
- **Reproducible**: Same infrastructure across environments
- **Plan & Apply**: Preview changes before applying

**Key Terraform Concepts:**
- **Providers**: Interface to APIs (AWS, Azure, GCP)
- **Resources**: Infrastructure components (EC2, VPC, etc.)
- **Variables**: Parameterize configurations
- **Outputs**: Export values for other configurations
- **State**: Track resource mappings and metadata

**Best Practices Learned:**
- Use remote state storage (S3 + DynamoDB)
- Implement state locking
- Use modules for reusability
- Follow naming conventions
- Tag all resources

### 3. Containerization with Docker

**Docker Fundamentals:**
- **Images**: Read-only templates for containers
- **Containers**: Running instances of images
- **Dockerfile**: Instructions to build images
- **Layers**: Images built in layers for efficiency

**Multi-stage Builds:**
```dockerfile
# Build stage - includes dev dependencies
FROM node:18-alpine AS builder
# ... build steps

# Production stage - minimal runtime
FROM node:18-alpine AS production
# ... copy only production artifacts
```

**Security Best Practices:**
- Use non-root users
- Minimal base images (Alpine)
- Health checks
- Resource limits
- Vulnerability scanning

### 4. Kubernetes Orchestration

**Core Kubernetes Objects:**
- **Pods**: Smallest deployable units
- **Deployments**: Manage replica sets and rolling updates
- **Services**: Network abstraction for pod access
- **ConfigMaps/Secrets**: Configuration and sensitive data

**Deployment Strategies:**
- **Rolling Updates**: Gradual replacement of old pods
- **Blue-Green**: Switch between two identical environments
- **Canary**: Gradual traffic shift to new version

**Resource Management:**
```yaml
resources:
  requests:    # Guaranteed resources
    memory: "64Mi"
    cpu: "50m"
  limits:      # Maximum resources
    memory: "128Mi"
    cpu: "100m"
```

### 5. CI/CD with GitHub Actions

**Pipeline Stages:**
1. **Test**: Code quality, unit tests, security scans
2. **Build**: Create and push container images
3. **Deploy**: Update Kubernetes deployments

**Key GitHub Actions Concepts:**
- **Workflows**: Automated processes triggered by events
- **Jobs**: Set of steps that execute on the same runner
- **Steps**: Individual tasks within a job
- **Actions**: Reusable units of code

**Security in CI/CD:**
- Store secrets in GitHub Secrets
- Use OIDC for AWS authentication (recommended)
- Implement least privilege access
- Scan container images for vulnerabilities

### 6. AWS Networking & Security

**VPC Design:**
- **Public Subnets**: Internet-facing resources (Load Balancers)
- **Private Subnets**: Application workloads (EKS nodes)
- **Multiple AZs**: High availability and fault tolerance

**Security Groups vs NACLs:**
- **Security Groups**: Stateful, instance-level firewall
- **NACLs**: Stateless, subnet-level firewall

**IAM Best Practices:**
- Principle of least privilege
- Use roles instead of users for services
- Regular access reviews
- Enable CloudTrail for auditing

## 🔧 Technical Challenges & Solutions

### Challenge 1: EKS Node Group Networking
**Problem**: Nodes couldn't join cluster due to networking issues
**Solution**: Ensure proper subnet tagging and security group rules
```bash
# Required subnet tags for EKS
kubernetes.io/cluster/<cluster-name> = shared
kubernetes.io/role/elb = 1  # for public subnets
kubernetes.io/role/internal-elb = 1  # for private subnets
```

### Challenge 2: Container Image Security
**Problem**: Running containers as root user
**Solution**: Create non-root user in Dockerfile
```dockerfile
RUN addgroup -g 1001 -S nodejs && \
    adduser -S nodejs -u 1001
USER nodejs
```

### Challenge 3: Resource Optimization
**Problem**: Pods consuming excessive resources
**Solution**: Implement resource requests and limits
- **Requests**: Kubernetes scheduler uses for placement
- **Limits**: Prevent resource starvation

### Challenge 4: Application Health Monitoring
**Problem**: Unhealthy pods receiving traffic
**Solution**: Implement health checks
- **Liveness Probe**: Restart unhealthy containers
- **Readiness Probe**: Control traffic routing

## 📊 Monitoring & Observability

### Metrics to Monitor:
- **Cluster Level**: Node CPU/Memory, Pod count
- **Application Level**: Response time, error rate, throughput
- **Infrastructure Level**: Network I/O, disk usage

### Tools Used:
- **CloudWatch**: AWS native monitoring
- **Prometheus**: Metrics collection
- **Grafana**: Visualization
- **ELK Stack**: Centralized logging

## 🚀 Performance Optimization

### Container Optimization:
- Use multi-stage builds
- Minimize image layers
- Use .dockerignore
- Choose appropriate base images

### Kubernetes Optimization:
- Set resource requests/limits
- Use horizontal pod autoscaling
- Implement pod disruption budgets
- Optimize node instance types

### Cost Optimization:
- Use Spot instances for non-critical workloads
- Implement cluster autoscaling
- Right-size resources based on metrics
- Use Reserved Instances for predictable workloads

## 🔒 Security Best Practices

### Container Security:
- Scan images for vulnerabilities
- Use minimal base images
- Run as non-root user
- Implement security contexts

### Kubernetes Security:
- Enable RBAC
- Use network policies
- Implement pod security policies
- Regular security updates

### AWS Security:
- Enable GuardDuty
- Use AWS Config for compliance
- Implement VPC Flow Logs
- Regular IAM access reviews

## 📈 Next Steps & Advanced Topics

### Areas for Further Learning:
1. **Service Mesh**: Istio, Linkerd for advanced networking
2. **GitOps**: ArgoCD, Flux for declarative deployments
3. **Advanced Monitoring**: Jaeger for distributed tracing
4. **Security**: Falco for runtime security monitoring
5. **Cost Management**: Kubecost for Kubernetes cost optimization

### Recommended Resources:
- AWS EKS Workshop
- Kubernetes Documentation
- CNCF Landscape
- DevOps Roadmap
- AWS Well-Architected Framework

---

**Key Takeaways:**
- Infrastructure as Code enables reproducible, version-controlled infrastructure
- Container orchestration with Kubernetes provides scalability and reliability
- CI/CD pipelines automate testing and deployment, reducing human error
- Security must be implemented at every layer of the stack
- Monitoring and observability are crucial for production systems

**Personal Reflection:**
This project provided hands-on experience with modern DevOps practices, combining cloud infrastructure, containerization, and automation. The integration of multiple technologies highlighted the importance of understanding how different components work together in a production environment.