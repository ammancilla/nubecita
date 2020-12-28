# Terraform EKS

### Prerequisites:

 • AWS CLI
 • Kubectl
 • VPC
 • EKS Cluster IAM Role

 REFERENCES:
 - AWS
  - EKS Cluster
    • https://aws.amazon.com/getting-started/hands-on/deploy-kubernetes-app-amazon-eks/
    • https://docs.aws.amazon.com/eks/latest/userguide/network_reqs.html
    • https://docs.aws.amazon.com/eks/latest/userguide/sec-group-reqs.html
    • https://docs.aws.amazon.com/eks/latest/userguide/cluster-autoscaler.html
  
  - EKS Node Group
    • https://docs.aws.amazon.com/eks/latest/userguide/managed-node-groups.html
    • https://docs.aws.amazon.com/eks/latest/userguide/create-node-role.html
  
   
 - TERRAFORM
  - EKS Cluster
    • https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/eks_cluster
  - EKS Node Group
    • https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/eks_node_group

 - AWS IAM
 • https://docs.aws.amazon.com/IAM/latest/UserGuide/id.html
 • https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_role
 • https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/iam_role


### Create The Cluster

**Cluster Authentication**:
- https://docs.aws.amazon.com/eks/latest/userguide/managing-auth.html
- https://github.com/kubernetes-sigs/aws-iam-authenticator
**NOTE**: When an Amazon EKS cluster is created, the IAM entity (user or role) that creates the cluster is added to the Kubernetes RBAC authorization table as the administrator (with system:masters permissions). Initially, only that IAM user can make calls to the Kubernetes API server using kubectl . For more information, see Managing users or IAM roles for your cluster.

Have at hand:
1. VPC ID
2. Private/Public subnet IDs
3. Security Group IDs

- Create IAM EKSCluster Role
  https://docs.aws.amazon.com/eks/latest/userguide/service_IAM_role.html
  https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/eks_cluster#example-iam-role-for-eks-cluster

- Configure Cluster Autoscaler
  https://docs.aws.amazon.com/eks/latest/userguide/cluster-autoscaler.html

- Enable control plane logging
  https://docs.aws.amazon.com/eks/latest/userguide/control-plane-logs.html
  https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/eks_cluster#enabling-control-plane-logging

### Create Node Group
Requires a running EKS cluster
