#!/bin/bash
# DevOps EKS Pipeline Cleanup Script
# This script safely destroys the EKS infrastructure

set -e

# Colors for output
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
NC='\033[0m' # No Color

# Configuration
AWS_REGION=${AWS_REGION:-"us-west-2"}
CLUSTER_NAME=${CLUSTER_NAME:-"devops-eks-cluster"}
TERRAFORM_DIR="infrastructure"

echo -e "${RED}🧹 DevOps EKS Pipeline Cleanup${NC}"
echo "=================================="

# Warning message
warning_message() {
    echo -e "${RED}⚠️  WARNING: This will destroy all infrastructure!${NC}"
    echo -e "${RED}This action cannot be undone.${NC}"
    echo ""
    echo "This will delete:"
    echo "- EKS Cluster: $CLUSTER_NAME"
    echo "- VPC and all networking components"
    echo "- EC2 instances (worker nodes)"
    echo "- Load balancers and associated resources"
    echo ""
}

# Remove applications from cluster
cleanup_applications() {
    echo -e "${YELLOW}🗑️  Removing applications from cluster...${NC}"
    
    # Check if cluster is accessible
    if kubectl cluster-info &> /dev/null; then
        # Delete application resources
        kubectl delete -f application/k8s/ --ignore-not-found=true
        
        # Wait for load balancers to be deleted
        echo -e "${YELLOW}⏳ Waiting for load balancers to be deleted...${NC}"
        sleep 30
        
        echo -e "${GREEN}✅ Applications removed${NC}"
    else
        echo -e "${YELLOW}⚠️  Cluster not accessible, skipping application cleanup${NC}"
    fi
}

# Destroy infrastructure
destroy_infrastructure() {
    echo -e "${YELLOW}💥 Destroying infrastructure...${NC}"
    cd $TERRAFORM_DIR
    terraform destroy -var="aws_region=$AWS_REGION" -var="cluster_name=$CLUSTER_NAME" -auto-approve
    cd ..
    echo -e "${GREEN}✅ Infrastructure destroyed${NC}"
}

# Clean up kubectl config
cleanup_kubectl() {
    echo -e "${YELLOW}🧹 Cleaning up kubectl config...${NC}"
    kubectl config delete-context arn:aws:eks:$AWS_REGION:*:cluster/$CLUSTER_NAME 2>/dev/null || true
    kubectl config delete-cluster arn:aws:eks:$AWS_REGION:*:cluster/$CLUSTER_NAME 2>/dev/null || true
    echo -e "${GREEN}✅ kubectl config cleaned${NC}"
}

# Verify cleanup
verify_cleanup() {
    echo -e "${YELLOW}🔍 Verifying cleanup...${NC}"
    
    # Check if cluster still exists
    if aws eks describe-cluster --name $CLUSTER_NAME --region $AWS_REGION &> /dev/null; then
        echo -e "${RED}❌ Cluster still exists${NC}"
        exit 1
    else
        echo -e "${GREEN}✅ Cluster successfully deleted${NC}"
    fi
}

# Main execution
main() {
    warning_message
    
    # Ask for confirmation
    echo -e "${RED}Are you sure you want to proceed? Type 'DELETE' to confirm:${NC}"
    read -r response
    
    if [[ "$response" == "DELETE" ]]; then
        cleanup_applications
        destroy_infrastructure
        cleanup_kubectl
        verify_cleanup
        
        echo -e "${GREEN}🎉 Cleanup complete!${NC}"
        echo "All infrastructure has been destroyed."
    else
        echo -e "${YELLOW}Cleanup cancelled${NC}"
    fi
}

# Run main function
main "$@"