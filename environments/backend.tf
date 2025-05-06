terraform {
  backend "s3" {
    bucket = "s3-bucket-for-boto3"
    key = "dev/eks-cluster/terraform-tfstate"
    region = "us-east-1"
    dynamodb_table = "terraform-lock-table"
    encrypt = true
    
  }
}