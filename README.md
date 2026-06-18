# Wiz Technical Exercise — GCP

## Architecture
- VM MongoDB 4.4 (outdated) in public subnet with SSH exposed
- GKE cluster (private subnet) running Tasky app
- GCS bucket with public read/listing for DB backups
- Cloud Native Security: audit logging, firewall deny-by-default, IAM change detection

## Infrastructure
- VPC: wiz-vpc
- Project: clgcporg10-163
- Region: us-central1

## App
- Tasky (Go + MongoDB todo app)
- Exposed via GKE Ingress + GCP Load Balancer
- Image: us-central1-docker.pkg.dev/clgcporg10-163/wiz-repo/tasky:latest

## Security misconfigurations (intentional)
1. SSH port 22 open to 0.0.0.0/0
2. VM Service Account with roles/editor
3. MongoDB 4.4.0 (outdated)
4. GCS backup bucket with public read + listing
5. Pod with cluster-admin ClusterRoleBinding
