module "vpc" {
  source          = "../../modules/VPC"
  cluster_name    = var.cluster_name
  vpc_cidr        = "10.0.0.0/16"
  public_subnets  = ["10.0.1.0/24", "10.0.2.0/24"]
  private_subnets = ["10.0.101.0/24", "10.0.102.0/24"]
  azs             = ["${var.region}a", "${var.region}b"]

}

module "iam" {
  source       = "../../modules/iam"
  cluster_name = var.cluster_name

}

module "eks" {
  source           = "../../modules/eks"
  cluster_name     = var.cluster_name
  cluster_role_arn = module.iam.cluster_role_arn
  node_role_arn    = module.iam.node_role_arn
  subnet_ids       = module.vpc.private_subnet_ids  # ✅ THIS LINE IS REQUIRED
}