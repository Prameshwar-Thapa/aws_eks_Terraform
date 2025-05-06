output "cluster_id" {
  value = aws_eks_cluster.eks.id
}

output "cluster_endpoint" {
    value = aws_eks_cluster.eks.endpoint
  
}

output "kubeconfig" {
    value = aws_eks_cluster.eks.certificate_authority[0].data
  
}