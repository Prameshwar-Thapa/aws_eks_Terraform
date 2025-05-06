variable "cluster_name"{}
variable "cluster_role_arn" {}
variable "node_role_arn" {}
variable "subnet_ids" {
  description = "List of private subnet IDs for EKS cluster networking"
  type        = list(string)
}


variable "cluster_version" {
  description = "Kubernetes version"
  type        = string
  default     = "1.28"
}

variable "desired_size" {
    default = 2
  
}

variable "min_size" {
    default = 1
  
}

variable "max_size" {
    default = 3
  
}

variable "instance_type" {
    default = ["t3.medium"]
  
}