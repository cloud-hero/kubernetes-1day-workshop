variable "cluster_name" {}
variable "cluster_version" {}
variable "eks_subnets" {}
variable "eks_api_access" {}
variable "vpc_id" {}
variable "project_name" {}
variable "endpoint_public_access" {
  default = true
}
variable "endpoint_private_access" {
  default = true
}
variable "argo_workflows_sa" {
  default = null
}
variable "service_ipv4_cidr" {
  default = "10.244.240.0/20" 
}
variable "cluster_autoscaler_sa" {
  default = null
}
variable "alb_controller_sa" {
  default = null
}
