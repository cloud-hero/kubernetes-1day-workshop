provider "aws" {
  region = "eu-central-1"
}  

module "vpc" {
  source              = "./modules/vpc"
  cluster_name        = var.cluster_name
  vpc_cidr            = var.vpc_cidr
  region_azs          = var.region_azs
  num_public_subnets  = var.num_public_subnets
  num_private_subnets = var.num_private_subnets
  project_name        = var.project_name
}

module "eks" {
  source                = "./modules/eks"
  cluster_name          = var.cluster_name
  cluster_version       = var.cluster_version
  eks_subnets           = module.vpc.public_subnets
  vpc_id                = module.vpc.vpc_id
  eks_api_access        = ["0.0.0.0/0"]
  project_name          = var.project_name
  argo_workflows_sa     = "argo:argo-workflow"
  cluster_autoscaler_sa = "kube-system:cluster-autoscaler"
  alb_controller_sa     = "kube-system:aws-load-balancer-controller"
}

module "eks_general_nodes" {
  source              = "./modules/eks_node_group"
  cluster_name        = module.eks.cluster_name
  node_group_subnets  = module.vpc.private_subnets
  vpc_id              = module.vpc.vpc_id
  project_name        = var.project_name  
}

