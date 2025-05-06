variable "cluster_name" {
  description = "Name of the EKS cluster"
  type        = string
  default     = "eks-dev-cluster"
}

variable "region" {
  description = "AWS Region where resources will be created"
  type        = string
  default     = "us-east-1"
}
